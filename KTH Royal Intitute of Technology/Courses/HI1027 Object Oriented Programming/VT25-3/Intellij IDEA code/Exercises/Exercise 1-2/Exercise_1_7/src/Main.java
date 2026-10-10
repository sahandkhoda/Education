/** === Uppgift 7, Mera bråk ===
 * Det är lämpligt att ett bråk alltid representeras på förenklad form (till exempel 10/15 => 2/3).
 * För att på ett enkelt sätt alltid hålla bråket på enklaste form kan du skriva en privat hjälpmetod som dividerar täljare och nämnare med största gemensamma delare.
 * I vilka metoder behöver vi anropa gcd?
 */

public class Main {

    public static void main(String[] args) {

        Rational r1 = new Rational(4,3);
        Rational r2 = new Rational(123,-33);

        Rational r3 = r1.add(r2);
        Rational r4 = r1.add(3);

        System.out.println(r2.toString());
        System.out.println(r3.toString());
        System.out.println(r4.toString());

    }

}