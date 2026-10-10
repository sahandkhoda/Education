import java.util.ArrayList;
import java.util.Collections;

public class Deck {

    // PRIVATE DATA MEMBERS

    private final ArrayList<Card> deck;


    // CONSTRUCTOR

    public Deck() {
        deck = new ArrayList<>();
        fill();
        shuffleCards();
    }


    // MUTATOR METHODS

    public Card dealCard() {
        Card topCard = new Card(deck.get(0).getSuit(), deck.get(0).getRank());
        deck.remove(0);
        return topCard;
    }


    // ACCESS METHODS

    public ArrayList<Card> getCards() {
        return new ArrayList<Card>(deck);
    }


    // DISPLAY

    @Override
    public String toString() {

        StringBuilder stringBuilder = new StringBuilder();
        for (Card card : deck) {
            stringBuilder.append(card.toString()).append("\n");
        }

        return stringBuilder.toString();
    }


    // PRIVATE HELP METHODS

    private void fill() {
        deck.clear();
        for (Suit suit : Suit.values()) {
            for (Rank rank : Rank.values()) {
                deck.add(new Card(suit, rank));
            }
        }
    }

    private void shuffleCards() {
        Collections.shuffle(deck);
    }

}
