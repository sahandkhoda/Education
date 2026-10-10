import java.util.ArrayList;
import java.util.Collections;

public class Pile {

    // PRIVATE DATA MEMBERS

    private final ArrayList<Card> pile;


    // CONSTRUCTOR

    public Pile() {
        pile = new ArrayList<>();
    }


    // PUBLIC MUTATOR METHODS

    public void addCard(Card c) {
        pile.add(c);
    }


    // PUBLIC ACCESS METHODS

    public ArrayList<Card> getPile() {
        return new ArrayList<>(pile);
    }

    public void sortPile() {
        Collections.sort(pile);
    }

    public int getPileSize() {
        return pile.size();
    }

    @Override
    public boolean equals(Object o) {

        // Check if same object
        if (this == o) {
            return true;
        }

        // Check if same class instance
        if (o instanceof Pile) {

            // Down cast
            Pile other = (Pile) o;

            // Compare pile sizes
            if (pile.size() != other.getPileSize()) {
                return false;
            }

            // Compare each card
            for (Card pCard : pile) {
                boolean isSameCard = false;
                for (Card oCard : other.getPile()) {
                    if (pCard.equals(oCard)) {
                        isSameCard = true;
                        break;
                    }
                }
                if (!isSameCard) {
                    return false;
                }
            }

            return true;

        }

        // Else
        return false;

    }


    // DISPLAY

    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        for (Card card : pile) {
            stringBuilder.append(card.toString()).append("\n");
        }
        return stringBuilder.toString();
    }

}