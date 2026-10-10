/**
 * Uppgift 1, Tärning
 * ===================
 * a) Skriv en klass, Dice, som modeller en tärning.
 * En tärning vänder alltid en viss sida upp (ett tal 1 - 6). Detta representeras med en datamedlem, som
 * jag kallar value.
 * En tärning kan kastas och då slumpas en ny sida fram. Det ska vara möjligt att skriva ut information
 * om tärningen snyggt. Vi behöver alltså följande metoder:
 *  En konstruktor. Låt en nyskapad tärning vända sidan 1 upp.
 *  En metod, throwDice, för att kasta tärningen, d.v.s. slumpa ett nytt värde.
 *  En metod, getValue, för att avläsa värdet på en tärning.
 *  En metod, toString, för att få textinformation om tärningens tillstånd.
 * För att slumpa tal kan man använda sig av Math.random() som returnerar ett slumptal i intervallet
 * [0.0..1.0[. Heltal i intervallet 1 – 6 fås med value = (int)(Math.random()*6)+1;
 * ===================
 * b) Skriv också ett main där 2 tärningar kastas ett antal gånger och resultatet skrivs ut.
 * ===================
 * c) Skriv även kod som kastar en tärning 1000 gånger och beräknar frekvensen för de olika sidorna.
 */

public class Main {

    public static void main(String[] args) {

        Dice dice1 = new Dice();
        Dice dice2 = new Dice();

        // Throw Dice 1
        int throw1 = 3;
        for (int i=0; i<throw1; i++) {
            dice1.throwDice();
        }
        System.out.println(dice1.toString());

        // Throw Dice 2
        int throw2 = 3;
        for (int i=0; i<throw2; i++) {
            dice2.throwDice();
        }
        System.out.println(dice2.toString());

        // Throw Dice 3
        int[] frequencies = new int[6];
        Dice dice3 = new Dice();
        int throw3 = 1000;
        for (int i=0; i<throw3; i++) {
            dice3.throwDice();
            frequencies[dice3.getValue()-1] += 1;
        }

        System.out.print("[ ");
        for (int frequency : frequencies) {
            System.out.print(frequency + " ");
        }
        System.out.print("]");

    }

}