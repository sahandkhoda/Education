/**
 * An enhanced version of Account3
 * - using the "this" keyword to distinguish between data members
 *   and local variables
 * - overloading the constructor
 * - handling illegal values in deposit/withdraw by throwing an
 *   exception, i.e. terminating the execution
 */

public class Account {

    // private fields
    private double balance;
    private final String name;
    private final long account_number;

    // constructors, called when an object/instance is created
    public Account(String name, double balance, long account_number) {
        this.name = name;
        this.balance = balance;
        this.account_number = account_number;
    }

    public Account(String name) {
        this(name,0,0);
    }

    // access methods
    public double getBalance() {
        return balance;
    }

    public String getName() {
        return name;
    }

    public long getAccount_number() {
        return account_number;
    }

    // mutator methods
    public void deposit(double amount) {
        if (amount < 0) {
            // unexpected - terminate execution
            throw new IllegalArgumentException();
        }
        balance += amount;
    }

    public void withdraw(double amount) {
        if (amount < 0 || amount > balance) {
            throw new IllegalArgumentException();
        }
        balance -= amount;
    }

    // other methods
    @Override
    public String toString() {
        String info =
                "NAME: " + name + "\n" +
                "BALANCE: ";
        info += String.format("%.2f\n", balance);
        info += "ACCOUNT NUMBER: " + account_number;
        return info;
    }
}