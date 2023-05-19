@SuppressWarnings('PMD.AvoidGlobalModifier')
global without sharing class PublicHolidayInvocable {
    global class KHolidayException extends Exception {
    }

    @InvocableMethod(label='KR Public Holiday' description='공공데이터포털조회' category='Calendar' callout=true)
    global static void getHolidayInfo(List<Requests> params) {
        upsertHolidays(params[0].year, params[0].month);
    }

    @future(callout=true)
    global static void upsertHolidays(Integer year, Integer month) {
        try {
            KHolidayCredentials__c publicApiCredential = KHolidayCredentials__c.getOrgDefaults();

            if (publicApiCredential == null || publicApiCredential.ServiceKey__c == null) {
                throw new KHolidayException('Missing service key');
            }

            String endpoint = 'https://apis.data.go.kr/B090041/openapi/service/SpcdeInfoService/getRestDeInfo';
            String serviceKey = publicApiCredential.ServiceKey__c;

            String solYear = String.valueOf(year);
            String solMonth = String.valueOf(month).leftPad(2, '0');

            String compose =
                '?serviceKey=' +
                EncodingUtil.urlEncode(serviceKey, 'UTF-8') +
                '&solYear=' +
                EncodingUtil.urlEncode(solYear, 'UTF-8') +
                '&solMonth=' +
                EncodingUtil.urlEncode(solMonth, 'UTF-8') +
                '&_type=json';

            HttpRequest request = new HttpRequest();
            request.setEndpoint(endpoint + compose);
            request.setMethod('GET');
            request.setHeader('Content-Type', 'application/json;charset=UTF-8');

            Http h = new Http();
            HttpResponse response = h.send(request);

            PublicHolidayBuilder builder = new PublicHolidayBuilder(response.getBody());
            List<Holiday> holidays = builder.build();

            Date currentMonthFisrtDay = Date.newInstance(year, month, 1);
            Date nextMonthFirstDay = currentMonthFisrtDay.addMonths(1);

            Set<String> nameSet = new Set<String>();

            for (Holiday h1 : [
                SELECT Id, Name
                FROM Holiday
                WHERE ActivityDate >= :currentMonthFisrtDay AND ActivityDate < :nextMonthFirstDay
                WITH SECURITY_ENFORCED
            ]) {
                nameSet.add(h1.Name);
            }

            List<Holiday> holidayToInsert = new List<Holiday>();

            for (Holiday h2 : holidays) {
                if (!nameSet.contains(h2.Name)) {
                    holidayToInsert.add(h2);
                }
            }

            SObjectAccessDecision decision = Security.stripInaccessible(AccessType.CREATABLE, holidayToInsert);

            insert decision.getRecords();
        } catch (Exception e) {
            throw new KHolidayException(e.getMessage());
        }
    }

    global class Requests {
        @InvocableVariable(label='년' description='Year' required=true)
        global Integer year;

        @InvocableVariable(label='월' description='Month' required=true)
        global Integer month;
    }
}