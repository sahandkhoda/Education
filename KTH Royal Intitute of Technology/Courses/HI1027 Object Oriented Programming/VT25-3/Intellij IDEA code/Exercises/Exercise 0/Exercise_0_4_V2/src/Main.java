/**
 * === Uppgift 4 ===
 * Burrleken går till på följande sätt. Man bestämmer ett burrtal mellan 2 och 9. Talen 1 t o m 99 skrivs
 * ut, i tur och ordning, men de tal som är jämnt delbara med burrtalet eller innehåller burrtalet som en
 * siffra ersätts med ordet ”burr”. Skriv ett program som leker burrleken, t ex med talet 3.
 * Burrtalet: 3
 * 1 2 burr 4 5 burr 7 8 burr 10
 * 11 burr burr 14 ...
 * Använd heltalstypen int. Rest vid heltalsdivision får du med operatorn %. Talet n är jämt delbart
 * med 3 om n%3 == 0
 */

import java.util.Locale;
import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        // Condition: play again
        String condition_play;

        do {

            // === DEFINE MATRIX ===

            // Condition: row
            int row;
            boolean condition_row;
            do {
                condition_row = true;
                System.out.print("Enter row number: ");
                row = scan.nextInt();
                if (row < 1 || row > 9) {
                    System.out.println("ERROR! Row number must be in the range [1-9].");
                    condition_row = false;
                }
            } while (!condition_row);

            // Condition: column
            int col;
            boolean condition_col;
            do {
                condition_col = true;
                System.out.print("Enter col number: ");
                col = scan.nextInt();
                if (col < 1 || col > 9) {
                    System.out.println("ERROR! Column number must be in the range [1-9].");
                    condition_col = false;
                }
            } while (!condition_col);


            // Assign matrix elements
            int[][] matrix = new int[row][col];
            int element = 0;
            for (int i = 0; i < matrix.length; i++) {           // Outer loop: iterate over rows (1D-arrays)
                for (int j = 0; j < matrix[i].length; j++) {    // Inner loop: iterate over columns (elements of row i)
                    matrix[i][j] = element++;
                }
            }


            // === ASSIGN BURR NUMBER ===

            int burr;
            boolean condition_burr;
            do {
                condition_burr = true;
                System.out.print("\n" + "Enter burr number [1-9]: ");
                burr = scan.nextInt();
                if (burr < 1 || burr > 9) {
                    System.out.println("ERROR! Burr number must be in the range [1-9].");
                    condition_burr = false;
                }

            } while (!condition_burr);


            // === DISPLAY ===

            // Outer loop: iterate over rows (1D-arrays)
            for (int[] r : matrix) {

                // Inner loop: iterate over columns (elements of row i)
                for (int c : r) {

                        // Dividable by "burr"?
                        if (c % burr == 0) {
                            System.out.print("br ");
                            continue;
                        }

                        // Starts with "burr"?
                        if ((c / 10) != 0 && (c / 10) == burr) {    // Note: In a ratio of two integers, decimals are neglected.
                            System.out.print("br ");
                            continue;
                        }

                        // Ends with "burr"?
                        if (c % 10 == burr) {                       // Note: Taking the modulus 10 of a two-digit number returns its last digit (i.e., the remainder when divided by 10).
                            System.out.print("br ");
                            continue;
                        }

                        // Print the number.
                        System.out.printf("%02d ", c);

                    }

                // One line for every row
                System.out.println();

            }

            // Play again?
            System.out.print("\n" + "Play again? (y/n): ");
            condition_play = scan.next();

        } while (condition_play.toLowerCase(Locale.ROOT).equals("y") || condition_play.toLowerCase(Locale.ROOT).equals("yes"));

    }

}