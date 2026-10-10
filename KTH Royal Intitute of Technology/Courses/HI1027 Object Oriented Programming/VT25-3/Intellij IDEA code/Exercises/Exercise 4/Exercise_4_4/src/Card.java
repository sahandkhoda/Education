public class Card implements Comparable<Card> {

    // PRIVATE DATA MEMBERS

    private final Rank rank;
    private final Suit suit;

    // CONSTRUCTOR

    public Card(Rank rank, Suit suit) {
        this.rank = rank;
        this.suit = suit;
    }

    public Card(int rank, int suit) {
        this(Rank.intToRank(rank), Suit.intToSuit(suit));
    }

    // PUBLIC ACCESS METHODS

    public Rank getRank() {
        return rank;
    }

    public Suit getSuit() {
        return suit;
    }

    @Override
    public boolean equals(Object o) {

        // Check if same object
        if (this == o) {
            return true;
        }

        // Check if same class instance
        if (o instanceof Card other) {
            return  this.rank == other.getRank() && this.suit == other.getSuit();
        }

        // Else
        return false;

    }

    @Override
    public int compareTo(Card other) {

        // Determine integer differences
        int rankDif = this.rank.getValue() - other.getRank().getValue();
        int suitDif = this.suit.getValue() - other.getSuit().getValue();

        // If same rank, check suit.
        if (rankDif == 0) {
            return suitDif;
        }
        return rankDif;
    }


    // DISPLAY

    @Override
    public String toString() {
        return rank + " of " + suit;
    }


}