public class Account4 {

    // private fields
    private double balance;
    private final String name;

    private static double interest = 0.25; // static member, i.e. class data

    // constructors, called when an object/instance is created
    public Account4(String name, double balance) {
        this.name = name;
        this.balance = balance;
    }

    public Account4(String name) {
        this(name, 0.0);
    }

    // access methods
    public double getBalance() {
        return balance; // return a copy of the value
    }

    public String getName() {
        return name;
    }

    // static methods; can only reference static members
    public static double getInterest() {
        return interest;
    }

    public static void setInterest(double newInterest) {
        interest = newInterest;
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
        String info = "name: " + name + ", balance: ";
        info += String.format("%.2f", balance);
        return info;
    }
}
