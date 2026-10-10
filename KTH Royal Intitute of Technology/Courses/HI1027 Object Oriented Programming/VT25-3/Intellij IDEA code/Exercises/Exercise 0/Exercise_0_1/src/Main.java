/**
 * === Uppgift 1 ===
 * En bank tillämpar följande räntesats på ett sparkonto.
 * För den del av beloppet som understiger 100 000 kr är räntan 0.5%
 * För den del av beloppet som överstiger 100 000 kr är räntan 2.5%
 * Skriv ett program som räknar ut årsräntan om man har k kr på kontot under hela året.
 * Använd flyttalstypen double för beloppen. Du läser in ett flyttal från tangentbordet med
 * double x;
 * x = scan.nextDouble();
 */

import java.util.Scanner;

public class Main {

    public static void main(String[] args) {

        final double LIMIT = 100_000;
        final double INTEREST_0_5 = 0.5 / 100;
        final double INTEREST_2_5 = 2.5 / 100;

        Scanner scan = new Scanner(System.in);

        System.out.println();
        System.out.print("Enter balance [$]: ");
        double balance = scan.nextDouble();

        if (balance < 0) {

            System.out.println("ERROR! Balance is too low!");

        } else {

            double interest_0_5;
            double interest_2_5;

            if (balance < LIMIT) {
                interest_0_5 = balance * INTEREST_0_5;
                interest_2_5 = 0;

            } else {
                interest_0_5 = LIMIT * INTEREST_0_5;
                interest_2_5 = (balance-LIMIT) * INTEREST_2_5;
            }

            double interest = interest_0_5 + interest_2_5;

            double newBalance = balance + interest;
            double newBalanceRounded = (double) Math.round(newBalance * 100) / 100;

            System.out.println();
            System.out.println("STARTING BALANCE: $" + balance);
            System.out.println("INTEREST LIMIT:   $" + LIMIT);
            System.out.println("===========");
            System.out.println("Interest (0.5%) for amount UNDER LIMIT: $" + interest_0_5);
            System.out.println("Interest (0.5%) for amount OVER  LIMIT: $" + interest_2_5);
            System.out.println("TOTAL INTEREST: $" + interest);
            System.out.println("===========");
            System.out.println("NEW BALANCE (after 1 year): $" + newBalanceRounded);

        }

    }

}