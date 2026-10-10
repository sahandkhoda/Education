public class Bid {

    // PRIVATE DATA MEMBERS

    private final User bidder;
    private final int bid;


    // CONSTRUCTOR

    public Bid(User bidder, int bid) {
        this.bidder = bidder;
        this.bid = bid;
    }


    // ACCESS METHODS

    public User getBidder() {
        return bidder;
    }

    public int getBid() {
        return bid;
    }


    // DISPLAY

    public String toString() {
        return bidder.getUsername() + " : $" + bid + "\n";
    }

}
