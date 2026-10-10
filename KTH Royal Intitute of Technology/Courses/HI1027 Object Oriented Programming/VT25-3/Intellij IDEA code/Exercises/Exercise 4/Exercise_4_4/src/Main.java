public class Main {

    public static void main(String[] args) {

        Card c1 = new Card(Rank.ACE,Suit.HEARTS);
        Card c2 = new Card(3,2);
        Card c3 = new Card(12,4);
        Card c4 = new Card(1,2);
        Card c5 = new Card(Rank.THREE,Suit.SPADES);

        Pile p = new Pile();
        p.addCard(c1);
        p.addCard(c2);
        p.addCard(c3);
        p.addCard(c4);
        p.addCard(c5);
        System.out.println(p.toString());
        p.sortPile();
        System.out.println(p.toString());

    }

}