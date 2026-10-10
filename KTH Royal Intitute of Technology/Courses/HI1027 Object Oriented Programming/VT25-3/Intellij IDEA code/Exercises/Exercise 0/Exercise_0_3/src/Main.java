import java.util.Arrays;
import java.util.Scanner;

/**
 * Skriv ett program som slumpar 1000 tärningskast och skriver ut frekvenserna för respektive resultat
 * (d v s antal 1:or, antal 2:or, o s v).
 * Till din hjälp behöver du en array med plats för 6 heltal, frekvenserna .
 * Du slumpar ett tal i intervallet 1-6 med
 * int x;
 * x = (int) (Math.random()*6 + 1);
 */

public class Main {

    public static void main(String[] args) {

        int[] frequencies = new int[6];

        for (int i = 0; i < 1000; i++) {
            frequencies[ ((int) (Math.random() * 6) + 1) - 1]++;
        }

        System.out.print(Arrays.toString(frequencies));

    }

}