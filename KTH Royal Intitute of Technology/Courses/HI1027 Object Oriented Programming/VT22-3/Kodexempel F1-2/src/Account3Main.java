
public class Account3Main {

    public static void main(String[] args) {

        Account3 acc = new Account3("Anders", 1000.0);

        System.out.println(acc.toString());

        acc.deposit(5000.0);
        acc.withdraw(2000.0);

        System.out.println(acc.toString());

        acc.withdraw(8000.0);               // Breaks the contract!

        System.out.println(acc.toString());
    }
}
