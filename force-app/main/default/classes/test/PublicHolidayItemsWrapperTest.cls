@isTest
public class PublicHolidayItemsWrapperTest {
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
            '        \"item\": [' +
            '          {' +
            '            \"dateKind\": \"01\",' +
            '            \"dateName\": \"어린이날\",' +
            '            \"isHoliday\": \"Y\",' +
            '            \"locdate\": 20230505,' +
            '            \"seq\": 1' +
            '          },' +
            '          {' +
            '            \"dateKind\": \"01\",' +
            '            \"dateName\": \"부처님오신날\",' +
            '            \"isHoliday\": \"Y\",' +
            '            \"locdate\": 20230527,' +
            '            \"seq\": 1' +
            '          },' +
            '          {' +
            '            \"dateKind\": \"01\",' +
            '            \"dateName\": \"대체공휴일\",' +
            '            \"isHoliday\": \"Y\",' +
            '            \"locdate\": 20230529,' +
            '            \"seq\": 1' +
            '          }' +
            '        ]' +
            '      },' +
            '      \"numOfRows\": 10,' +
            '      \"pageNo\": 1,' +
            '      \"totalCount\": 3' +
            '    }' +
            '  }' +
            '}';
        PublicHolidayItemsWrapper obj = PublicHolidayItemsWrapper.parse(json);
        System.assert(obj != null, 'parsed object is null');
    }
}