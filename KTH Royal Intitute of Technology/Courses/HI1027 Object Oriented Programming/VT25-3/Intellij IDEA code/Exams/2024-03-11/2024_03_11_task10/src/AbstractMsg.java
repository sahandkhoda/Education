abstract public class AbstractMsg {

    // DATA MEMBERS

    private final String sender, receiver;
    protected String message;


    // CONSTRUCTOR

    protected AbstractMsg(String sender, String receiver, String message) {
        this.sender = sender;
        this.receiver = receiver;
        setMessage(message);
    }


    // PUBLIC MUTATOR METHODS

    abstract public boolean setMessage(String msg);


    // PUBLIC ACCESS METHODS

    public String getSender() {
        return sender;
    }

    public String getReceiver() {
        return receiver;
    }

    public String getMessage() {
        return message;
    }


    // DISPLAY

    @Override
    public String toString() {
        return  "Sender   : " + sender      + "\n" +
                "Receiver : " + receiver    + "\n\n" +
                message;
    }

}
