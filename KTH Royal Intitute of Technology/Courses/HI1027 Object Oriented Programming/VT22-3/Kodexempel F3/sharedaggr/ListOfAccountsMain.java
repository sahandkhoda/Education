package sharedaggr;


public class ListOfAccountsMain {

    public static void main(String[] args) {

        ListOfAccounts list = new ListOfAccounts();

        Account a = new Account("Ann");
        Account b = new Account("Per");
        a.deposit(1000);
        b.deposit(500);

        list.addAccount(a);
        list.addAccount(b);
        list.addAccount(new Account("Anders"));

        System.out.println(list.toString());

        // Search for a specific Account
        System.out.println("Searching...");
        Account x;
        x = list.findAccount("Per");
        if (x != null) {
            System.out.println("Found\n" + x.toString());
        }
    }
}
