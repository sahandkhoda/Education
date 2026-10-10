public class Main {

    public static void main(String[] args) {

        SmsMsg sms = new SmsMsg("Adam Sandler", "Kevin James", "Get Paul Blart!!!");

        System.out.println(sms.toString());

        MmsMsg mms = new MmsMsg("Adam Sandler", "Happy Gilmore", "Golf Clubs?!", "https://ChrisGonnaRockWill");
        System.out.println(mms.toString());

    }
}