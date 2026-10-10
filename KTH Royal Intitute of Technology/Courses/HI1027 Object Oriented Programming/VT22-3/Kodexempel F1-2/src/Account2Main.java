
public class Account2Main {

    public static void main(String[] args) {

        Account2 acc = new Account2("Anders");

        System.out.println(acc.toString());

        acc.deposit(5000.0);
        acc.withdraw(2000.0);

        System.out.println(acc.toString());
        
        // syntax error, balance has private access
        // acc.balance = -1_000_000.0; 
    }
}
