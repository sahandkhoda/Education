import java.util.Scanner;

public class Main {

    /**
     * Skriv ett program som läser in ett godtyckligt antal heltal i en array och sedan skriver ut dessa i
     * omvänd ordning.
     * Du skapar arrayen med
     * int[] numbers = new int[n];
     * Du läser in heltalen med
     *  for(int i = 0; i < numbers.length; i++) {
     *  numbers[i] = scan.nextInt();
     *  }
     */

    public static void main(String[] args) {

        Scanner scan = new Scanner(System.in);

        System.out.print("Enter array length: ");
        int n = scan.nextInt();

        if (n < 1) {

            System.out.println("ERROR! Array length is less than 1!");

        } else {

            int[] numbers = new int[n];

            for (int i = 0; i < numbers.length; i++) {
                System.out.print("#" + (i + 1) + ": ");
                numbers[i] = scan.nextInt();
            }

            System.out.print("Reverse order: ");
            for (int i = numbers.length; i > 0; i--) {
                System.out.print(numbers[i - 1] + " ");
            }

        }

    }

}