
public class Account1Main {

    public static void main(String[] args) {
        Account1 acc = new Account1();

        String info = acc.name + ", " + acc.balance;
        System.out.println(info);

        acc.name = "Anders";
        acc.deposit(5000.0);
        acc.withdraw(2000.0);

        info = acc.name + ", " + acc.balance;
        System.out.println(info);

        acc.balance = -1_000_000.0; // breaks the contract(!)

        info = acc.name + ", " + acc.balance;
        System.out.println(info);
    }
}
