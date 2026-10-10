import java.util.ArrayList;

public class Pile {

    // PRIVATE DATA MEMBERS

    private ArrayList<Card> pile;


    // CONSTRUCTOR

    public Pile() {
        pile = new ArrayList<Card>();
    }


    // MUTATOR METHODS

    public void clear() {
        pile.clear();
    }

    public void addCard(Card card) {
        /*
        The following code is redundant because the Card class is immutable.
        Since its data members are declared as final, they cannot be reassigned after construction.
        As a result, there's no risk of unexpected modifications, so passing the same reference is safe.
            pile.add(new Card(card.getSuit(), card.getRank()));
        */
        pile.add(card);
    }

    public Card remove(int index) {
        Card temp = new Card(pile.get(index).getSuit(), pile.get(index).getRank());
        pile.remove(index);
        return temp;
    }

    // ACCESS METHODS

    public int getSize() {
        return pile.size();
    }

    public Card get(int index) {
        return new Card(pile.get(index).getSuit(), pile.get(index).getRank());
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
