
public class Account1 {

    // fields / data members
    double balance;
    String name;

    // member functions / methods
    void deposit(double amount) {
        if (amount >= 0) {
            balance += amount;
        }
    }

    void withdraw(double amount) {
        if (amount >= 0 && amount <= balance) {
            balance -= amount;
        }
    }
}
