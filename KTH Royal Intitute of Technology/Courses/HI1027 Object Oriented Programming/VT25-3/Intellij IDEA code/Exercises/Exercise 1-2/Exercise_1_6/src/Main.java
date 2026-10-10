/** === Uppgift 6, Räkna med bråk ===
 * *
 * Innan du börjar med denna uppgift bör du gå igenom klassen Complex, från föreläsningen.
 * Skriv en klass Rational, som lagrar information om ett bråk (rationellt tal), dvs. två heltal, täljare och nämnare.
 * Skriv konstruktorer så att man kan skapa ett bråk med två, en eller ingen parameter (i sista fallet lagras 0/1). Notera att nämnaren aldrig får vara 0.
 * Skriv metoderna:
 *  toString() så att en snygg utskrift fås,
 *  accessmetoder,
 *  metoden, add(Rational r) som adderar r till aktuellt bråk och returnerar ett nytt bråk, summan.
 *  En variant, add(int number) som adderar ett heltal till aktuellt bråk och returnerar ett nytt.
 * *
 * Testa din kod i en main-metod (förslag finns nedan).
 */

public class Main {

    public static void main(String[] args) {

        Rational r1 = new Rational(4,3);
        Rational r2 = new Rational(12,4);

        Rational r3 = r1.add(r2);
        Rational r4 = r1.add(3);

        System.out.println(r3.toString());
        System.out.println(r4.toString());


    }

}