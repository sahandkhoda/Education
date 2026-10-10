public class Main {

    public static void main(String[] args) {

        Deck deck = new Deck();
        System.out.println(deck.toString());

        Pile pile = new Pile();
        System.out.println(pile.toString());
        pile.addCard(new Card(Suit.DIAMONDS, Rank.ACE));
        pile.addCard(new Card(Suit.CLUBS, Rank.QUEEN));
        pile.addCard(new Card(Suit.SPADES, Rank.TEN));
        pile.addCard(new Card(Suit.HEARTS, Rank.THREE));
        System.out.println(pile.toString());

    }

}