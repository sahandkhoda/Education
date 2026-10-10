public enum Suit {

    CLUBS       (1),
    DIAMONDS    (2),
    HEARTS      (3),
    SPADES      (4);

    private final int value;

    private Suit(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }

    public static Suit intToSuit(int s) {
        for (Suit suit : Suit.values()) {
            if (suit.getValue() == s) {
                return suit;
            }
        }
        throw new IllegalArgumentException("Illegal suit value!");
    }

}
