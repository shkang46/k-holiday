@SuppressWarnings('PMD.AvoidGlobalModifier')
global with sharing class PublicHolidayBuilder {
    private List<PublicHolidayItemWrapper.Item> items;

    global PublicHolidayBuilder(String body) {
        this.items = extractItems(body);
    }

    global List<Holiday> build() {
        List<Holiday> holidays = new List<Holiday>();

        for (PublicHolidayItemWrapper.Item item : items) {
            if (item.isHoliday == 'Y') {
                holidays.add(new Holiday(Name = item.dateName, ActivityDate = integerToDate(item.locdate)));
            }
        }

        return holidays;
    }

    private List<PublicHolidayItemWrapper.Item> extractItems(String body) {
        List<PublicHolidayItemWrapper.Item> items = new List<PublicHolidayItemWrapper.Item>();

        try {
            try {
                PublicHolidayItemsWrapper itemsWrapper = PublicHolidayItemsWrapper.parse(body);
                items.addAll(itemsWrapper.response.body.items.item);
            } catch (Exception e) {
                PublicHolidayItemWrapper itemWrapper = PublicHolidayItemWrapper.parse(body);
                items.add(itemWrapper.response.body.items.item);
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return items;
    }

    /**
     * @description Convert integer to date type variable
     * @example '20230102' to Date(2023, 1, 2);
     */
    public static Date integerToDate(Integer locdate) {
        List<String> digits = String.valueOf(locdate).split('');

        String year = digits[0] + digits[1] + digits[2] + digits[3];
        String month = digits[4] + digits[5];
        String day = digits[6] + digits[7];

        return Date.valueOf(year + '-' + month + '-' + day);
    }
}