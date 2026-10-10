import java.util.ArrayList;

public class Auction {

    // PRIVATE DATA MEMBERS

    private final User owner;
    private final String item;
    private final ArrayList<Bid> bids;


    // CONSTRUCTOR

    public Auction(User owner, String item) {
        this.owner = owner;
        this.item = item;
        bids = new ArrayList<>();
    }



    // MUTATOR METHODS

    public void addBid(Bid bid) {
        bids.add(bid);
    }


    // ACCESS METHODS

    public User getOwner() {
        return new User(owner.getUsername(), owner.getEmail(), owner.getPassword());
    }

    public String getItem() {
        return item;
    }

    public ArrayList<Bid> getBids() {
        return new ArrayList<>(bids);
    }


    // DISPLAY

    public String toString() {

        StringBuilder stringBuilder = new StringBuilder();
        for (Bid bid : bids) {
            stringBuilder.append(bid.toString());
        }

        return  "=== AUCTION FOR: " + item + " ===\n" +
                owner + "\n" +
                "--- Bids ---\n" +
                stringBuilder;
    }

}
