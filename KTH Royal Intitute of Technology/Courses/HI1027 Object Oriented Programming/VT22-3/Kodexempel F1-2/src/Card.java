
/**
 * An instance of this class represents a card for playing card games.
 * suit: [1..4], rank: [1..13]
 * A card is immutable, i.e. once created its suit and rank can not be changed.
 */
public class Card {

    private final int suit, rank;

    private final static String[] suitStrings = {
        "spades", "hearts", "clubs", "diamonds"
    };
    private final static String[] rankStrings = {
        "Ace", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
        "Jack", "Queen", "King"
    };

    // Constructor
    public Card(int suit, int rank) {
        // Don't allow creation of illegal cards
        assert (suit >= 1 && suit <= 4 && rank >= 1 && rank <= 13);

        this.suit = suit;
        this.rank = rank;
    }

    /** Check whether this card and other card are equal. */
    public boolean equals(Card other) {
        return (this.suit == other.suit && this.rank == other.rank);
    }

    /** Access methods */
    public int getSuit() { return suit; }
    public int getRank() { return rank; }

    @Override
    public String toString() {
        String info = rankStrings[rank - 1] + " of " + suitStrings[suit - 1];
        return info;
    }
}
