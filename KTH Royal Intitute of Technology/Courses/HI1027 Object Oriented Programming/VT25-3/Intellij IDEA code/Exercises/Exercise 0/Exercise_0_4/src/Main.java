/**
 * === Uppgift 4 ===
 * Burrleken går till på följande sätt. Man bestämmer ett burrtal mellan 2 och 9. Talen 1 t o m 99 skrivs
 * ut, i tur och ordning, men de tal som är jämnt delbara med burrtalet eller innehåller burrtalet som en
 * siffra ersätts med ordet ”burr”. Skriv ett program som leker burrleken, t ex med talet 3.
 * Burrtalet: 3
 *  1 2 burr 4 5 burr 7 8 burr 10
 *  11 burr burr 14 ...
 * Använd heltalstypen int. Rest vid heltalsdivision får du med operatorn %. Talet n är jämt delbart
 * med 3 om n%3 == 0.
 */

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        System.out.print("Enter burr number: ");
        int burr = scan.nextInt();

        if (burr < 2 || burr > 9) {

            System.out.println("Invalid burr number");

        } else {

            /* ARRAY (MATRIX) */
            int[] iarr = new int[99];
            for (int i = 0; i < iarr.length; i++) {
                iarr[i] = i+1;
            }

            /* DISPLAY */
            int condition = 10;
            for (int i = 0; i < iarr.length; i++) {

                // New line for every "condition"-th number
                if (i % condition == 0) {
                    System.out.print("\n");
                }

                // Dividable by "burr"?
                if (iarr[i] % burr == 0) {
                    System.out.print("br ");
                }

                // Starts with "burr"?
                else if ( ((iarr[i] / 10 ) != 0) && ((iarr[i] / 10 ) % burr == 0) ) {
                    System.out.print("br ");
                }

                // Ends with "burr"?
                else if (iarr[i] % 10 == burr) {
                    System.out.print("br ");
                }

                // Print out number
                else {
                    System.out.printf("%02d ", iarr[i]);
                }

            }

        }

    }

}