public class MmsMsg extends AbstractMsg {

    // DATA MEMBER

    private final String imageURL;


    // CONSTRUCTORS

    public MmsMsg(String sender, String receiver, String message, String imageURL) {
        super(sender, receiver, message);

        if (!isCorrectImageURL(imageURL)) {
            throw new IllegalArgumentException("Invalid image URL : " + imageURL);
        }
        this.imageURL = imageURL;
    }

    // PUBLIC MUTATOR METHODS

    @Override
    public boolean setMessage(String msg) {
        int LIMIT = 80;
        if (msg.length() > LIMIT) {
            message = msg.substring(0, LIMIT);
            return false;
        } else {
            message = msg;
            return true;
        }
    }


    // PUBLIC ACCESS METHOD

    public String getImageURL() {
        return imageURL;
    }


    // DISPLAY

    @Override
    public String toString() {
        return  "=== MMS ==="       + "\n" +
                "URL : " + imageURL + "\n" +
                super.toString()    + "\n";
    }


    // PRIVATE HELP METHOD

    private boolean isCorrectImageURL(String imageURL) {
        return imageURL.startsWith("https://");
    }

}
