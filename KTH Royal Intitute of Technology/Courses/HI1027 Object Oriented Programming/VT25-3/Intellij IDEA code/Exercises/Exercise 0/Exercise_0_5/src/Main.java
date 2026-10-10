import java.util.Arrays;
import java.util.Scanner;

/**
 * Uppgift 5
 * Skriv ett program som slumpar fram veckans lottorad, dvs 7 unika värden i intervallet [1..35].
 * Delproblem att lösa: Hur kan vi vara säkra på ett tal som slumpas ännu inte lottats ut?
 * Idé till lösning (det finns många sätt att lösa detta):
 * Skapa en boolean array med 35 platser, alla fält initierade till false från början (false står nu för att
 * motsvarande tal ännu inte lottats ut). När ett tal lottas ut, markera detta med att sätta en true i
 * denna position.
 * NB: Array-index börjar på 0 i Java (precis som i C).
 */

public class Main {

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);
        System.out.print("Enter row length: ");
        int n = scan.nextInt();

        int[] row = new int[n];

        for (int i = 0; i < row.length; i++) {

            // Generate random number
            row[i] = (int) (Math.random()*35 + 1);

            for (int j = 0; j < row.length; j++) {

                // Do not compare number with itself (at same index).
                if (j==i) {
                    continue;
                }

                // If number exists at index j != i, generate another random number at index i.
                if (row[j] == row[i]) {
                    i--;
                }

            }

        }

        // DISPLAY
        System.out.println(Arrays.toString(row));

    }
}