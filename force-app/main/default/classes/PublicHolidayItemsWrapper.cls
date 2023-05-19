public class PublicHolidayItemsWrapper {
    public class Response {
        public Header header;
        public Body body;
    }

    public class Header {
        public String resultCode;
        public String resultMsg;
    }

    public class Items {
        public List<PublicHolidayItemWrapper.Item> item;
    }

    public Response response;

    public class Body {
        public Items items;
        public Integer numOfRows;
        public Integer pageNo;
        public Integer totalCount;
    }

    public static PublicHolidayItemsWrapper parse(String json) {
        return (PublicHolidayItemsWrapper) System.JSON.deserialize(json, PublicHolidayItemsWrapper.class);
    }
}