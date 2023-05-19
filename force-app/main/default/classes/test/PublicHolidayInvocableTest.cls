@isTest
public class PublicHolidayInvocableTest {
    @isTest
    static void testUpsertHolidays() {
        Test.setMock(HttpCalloutMock.class, new PublicHolidayInvocableTestMock());

        KHolidayCredentials__c publicApiCredential = new KHolidayCredentials__c();
        publicApiCredential.ServiceKey__c = 'test-service-key';
        insert publicApiCredential;

        Test.startTest();

        PublicHolidayInvocable.Requests param = new PublicHolidayInvocable.Requests();
        param.dt = Date.newInstance(2023, 5, 1);

        PublicHolidayInvocable.getHolidayInfo(new List<PublicHolidayInvocable.Requests>{ param });

        Test.stopTest();

        List<Holiday> holidays = [SELECT Id FROM Holiday];

        //System.Assert.areNotEqual(holidays, null);
        System.assertNotEquals(null, holidays, 'Null result');
        //System.Assert.areNotEqual(holidays.size(), 0);
        System.assertNotEquals(0, holidays.size(), 'Zero result');
    }

    @isTest
    static void testUpsertHoliday() {
        Test.setMock(HttpCalloutMock.class, new PublicHolidayInvocableTestMockSingle());

        KHolidayCredentials__c publicApiCredential = new KHolidayCredentials__c();
        publicApiCredential.ServiceKey__c = 'test-service-key';
        insert publicApiCredential;

        Test.startTest();

        PublicHolidayInvocable.Requests param = new PublicHolidayInvocable.Requests();
        param.dt = Date.newInstance(2023, 3, 1);

        PublicHolidayInvocable.getHolidayInfo(new List<PublicHolidayInvocable.Requests>{ param });

        Test.stopTest();

        List<Holiday> holidays = [SELECT Id FROM Holiday];

        //System.Assert.areNotEqual(holidays, null);
        System.assertNotEquals(null, holidays, 'Null result');
        //System.Assert.areNotEqual(holidays.size(), 0);
        System.assertNotEquals(0, holidays.size(), 'Zero result');
    }

    @isTest
    static void testUpsertHolidaysNoServiceKey() {
        Test.setMock(HttpCalloutMock.class, new PublicHolidayInvocableTestMock());

        PublicHolidayInvocable.Requests param = new PublicHolidayInvocable.Requests();
        param.dt = Date.newInstance(2023, 5, 1);

        try {
            Test.startTest();
            PublicHolidayInvocable.getHolidayInfo(new List<PublicHolidayInvocable.Requests>{ param });
            Test.stopTest();
        } catch (Exception e) {
            //System.Assert.isNotNull(e);
            System.assertNotEquals(null, e, 'Exception must handled');
        }
    }
}