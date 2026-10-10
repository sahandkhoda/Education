public class Card {

    // PRIVATE DATA MEMBERS

    private final Suit suit;
    private final Rank rank;


    // CONSTRUCTOR

    public Card(Suit suit, Rank rank) {
        this.suit = suit;
        this.rank = rank;
    }

    // ACCESS METHODS

    public Suit getSuit() {
        return suit;
    }

    public Rank getRank() {
        return rank;
    }

    @Override
    public String toString() {
        return rank + " of " + suit;
    }

}
