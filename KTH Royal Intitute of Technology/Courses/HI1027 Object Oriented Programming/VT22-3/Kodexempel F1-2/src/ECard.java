
public class ECard {

    private final Rank rank;
    private final Suit suit;

    public ECard(Rank rank, Suit suit) {
        this.rank = rank;
        this.suit = suit;
    }

    /** Check whether this card and other card are equal. */
    public boolean equals(ECard other) {
        return this.rank == other.rank && this.suit == other.suit;
    }

    /** Access methods */
    public Rank getRank() { return rank; }
    public Suit getSuit() { return suit; }
    public int getRankValue() { return rank.getValue(); }
    public int getSuitValue() { return suit.ordinal();  }       // default values, 0, 1, 2, 3

    @Override
    public String toString() {
        String info = rank + " of " + suit;
        return info;
    }
}
