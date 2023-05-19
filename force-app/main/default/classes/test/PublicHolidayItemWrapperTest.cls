@isTest
public class PublicHolidayItemWrapperTest {
    @isTest
    static void testParse() {
        String json =
            '{' +
            '  \"response\": {' +
            '    \"header\": {' +
            '      \"resultCode\": \"00\",' +
            '      \"resultMsg\": \"NORMAL SERVICE.\"' +
            '    },' +
            '    \"body\": {' +
            '      \"items\": {' +
            '        \"item\": {' +
            '          \"dateKind\": \"01\",' +
            '          \"dateName\": \"삼일절\",' +
            '          \"isHoliday\": \"Y\",' +
            '          \"locdate\": 20230301,' +
            '          \"seq\": 1' +
            '        }' +
            '      },' +
            '      \"numOfRows\": 10,' +
            '      \"pageNo\": 1,' +
            '      \"totalCount\": 1' +
            '    }' +
            '  }' +
            '}';
        PublicHolidayItemWrapper obj = PublicHolidayItemWrapper.parse(json);
        System.assert(obj != null, 'parsed object is null');
    }
}