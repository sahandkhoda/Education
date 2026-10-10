
/**
 * Demonstration of the method equals, used
 * to compare two objects for equal attributes.
 * NB: Don't use "==" when comparing objects
 * (x1==x2 check's whether the same object is
 * referenced by x1 and x2).
 */
public class CardMain {

    public static void main(String[] argv) {

        Card c1 = new Card(1, 1);   System.out.println(c1);
        Card c2 = new Card(4, 13);  System.out.println(c2);
        Card c3 = new Card(1, 1);   System.out.println(c3);
        System.out.println();

        boolean check12C = c1.equals(c2);
        System.out.println("c1 equals c2: " + check12C);

        boolean check13C = c1.equals(c3);
        System.out.println("c1 equals c3: " + check13C);

        boolean sameC = (c1 == c3);
        System.out.println("c1 == c3: " + sameC + "\n");

        ECard e1 = new ECard(Rank.ACE,Suit.DIAMONDS);   System.out.println(e1);
        ECard e2 = new ECard(Rank.KING,Suit.HEARTS);    System.out.println(e2);
        ECard e3 = new ECard(Rank.TWO,Suit.DIAMONDS);   System.out.println(e3);
        System.out.println();

        boolean check12E = e1.equals(e2);
        System.out.println("e1 equals e2: " + check12E);

        boolean check13E = c1.equals(c3);
        System.out.println("e1 equals e3: " + check13E);

        boolean sameE = (c1 == c3);
        System.out.println("e1 == e3: " + sameE + "\n");
    }
}
