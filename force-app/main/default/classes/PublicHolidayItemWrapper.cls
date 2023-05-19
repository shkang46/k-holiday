public class PublicHolidayItemWrapper {
    public class Response {
        public Header header;
        public Body body;
    }

    public class Item {
        public String dateKind;
        public String dateName;
        public String isHoliday;
        public Integer locdate;
        public Integer seq;
    }

    public class Header {
        public String resultCode;
        public String resultMsg;
    }

    public class Items {
        public Item item;
    }

    public class Body {
        public Items items;
        public Integer numOfRows;
        public Integer pageNo;
        public Integer totalCount;
    }

    public Response response;

    public static PublicHolidayItemWrapper parse(String json) {
        return (PublicHolidayItemWrapper) System.JSON.deserialize(json, PublicHolidayItemWrapper.class);
    }
}