public class PublicHolidayInvocableTestMockSingle implements HttpCalloutMock {
    public HttpResponse respond(HttpRequest req) {
        HttpResponse res = new HttpResponse();

        res.setHeader('Content-Type', 'application/json; charset=UTF-8');
        res.setBody(
            '{"response":{"header":{"resultCode":"00","resultMsg":"NORMAL SERVICE."},"body":{"items":{"item":{"dateKind":"01","dateName":"삼일절","isHoliday":"Y","locdate":20230301,"seq":1}},"numOfRows":10,"pageNo":1,"totalCount":1}}}'
        );
        res.setStatusCode(200);
        return res;
    }
}