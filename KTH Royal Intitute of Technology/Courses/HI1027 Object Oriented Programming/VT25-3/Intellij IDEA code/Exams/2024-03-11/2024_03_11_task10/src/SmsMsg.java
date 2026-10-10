import java.util.Arrays;

public class SmsMsg extends AbstractMsg {

    // CONSTRUCTOR

    public SmsMsg(String sender, String receiver, String message) {
        super(sender, receiver, message);
    }


    // PUBLIC MUTATOR METHODS

    @Override
    public boolean setMessage(String msg) {
        int LIMIT = 160;
        if (msg.length() > LIMIT) {
            message = msg.substring(0,LIMIT);
            return false;
        } else {
            message = msg;
            return true;
        }
    }


    // DISPLAY

    @Override
    public String toString() {
        return  "=== SMS ==="       + "\n" +
                super.toString()    + "\n";
    }


    // PRIVATE HELP METHODS



}
