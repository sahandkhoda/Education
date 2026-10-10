package sharedaggr;


/**
 * A class representing a list of bank accounts.
 * If the internal array is full, the array is
 * automatically resized.
 */
public class ListOfAccounts {

    private Account[] theAccounts;
    private int noOfAccs;

    public ListOfAccounts() {
        theAccounts = new Account[100];
        noOfAccs = 0;
    }

    public void addAccount(Account a) {
        if (noOfAccs >= theAccounts.length) {
            this.resize();
        }
        theAccounts[noOfAccs] = a;
        noOfAccs++;
    }

    public double getTotalBalance() {
        double total = 0;
        for (int i = 0; i < noOfAccs; i++) {
            total = total + theAccounts[i].getBalance();
        }
        return total;
    }

    public Account findAccount(String name) {
        Account a = null; // initialize
        String foundName;
        for (int i = 0; i < noOfAccs; i++) {
            foundName = theAccounts[i].getName();
            if (foundName.equals(name)) { // Not ==!
                a = theAccounts[i];
                break;
            }
        }
        return a;
    }

    /*
     * Return a copy of the private array -
     * "return theList;" would return the address/reference
     * to the private array(!)
     */
    public Account[] getTheAccounts() {
        Account[] copy = new Account[noOfAccs];
        for (int i = 0; i < noOfAccs; i++) {
            copy[i] = theAccounts[i];
        }
        return copy;
    }

    @Override
    public String toString() {
        StringBuilder info = new StringBuilder();
        info.append("The accounts\n");
        info.append("============\n");
        for (int i = 0; i < noOfAccs; i++) {
            info.append(theAccounts[i].toString()).append("\n");
        }
        return info.toString();
    }

    private void resize() {
        // Create a new array, double the size
        Account[] temp = new Account[theAccounts.length * 2];
        // Copy the references into the new array
        // System.arraycopy -could use a for-loop instead 
        System.arraycopy(theAccounts, 0, temp, 0, theAccounts.length);
        // Copy the reference to the new array into theList
        theAccounts = temp;
    }
}
