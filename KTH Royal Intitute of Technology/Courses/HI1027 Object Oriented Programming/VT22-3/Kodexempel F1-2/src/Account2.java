
/* A class representing a bank account.
 * This example demonstrates encapsulation.
 * Attributes are declared private, and may only be manipulated via the public methods.
 * This way the balance is guaranteed to always be >= 0.
 * The constructor initializes the name and the balance is set to zero.
 */
public class Account2 {

    // private fields
    private double balance;
    private final String name;

    // constructor, called when an object/instance is created
    public Account2(String name_) {
        name = name_;
        balance = 0.0;
    }

    // access methods
    public double getBalance() {
        return balance; // return a copy of the value
    }

    public String getName() {
        return name;
    }

    // mutator metods
    public void deposit(double amount) {
        if (amount >= 0) {
            balance += amount;
        }
    }

    public void withdraw(double amount) {
        if (amount >= 0 && amount <= balance) {
            balance -= amount;
        }
    }

    // other methods
    @Override
    public String toString() {
        String info = "name: " + name + ", balance: ";
        info += String.format("%.2f", balance);
        return info;
    }
}
