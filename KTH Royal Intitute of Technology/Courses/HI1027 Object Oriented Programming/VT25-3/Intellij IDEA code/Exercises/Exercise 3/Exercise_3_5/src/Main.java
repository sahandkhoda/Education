import java.time.LocalDate;
import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {

        Pnr adanPnr = Pnr.createPnr("600101-1111"); // constructor is private
        Member adam = new Member("Adam Sandler", adanPnr);
        System.out.println(adam.toString() + "\n");

        Kayak k1 = new Kayak("WKV 540", KLevel.SKILLED, 1, adam);
        Kayak k2 = new Kayak("Point 65", KLevel.EASY, 2, adam);

        LoanManager manager = new LoanManager();
        manager.addKayak(k1);
        manager.addKayak(k2);
        System.out.println(manager.toString());

        ArrayList<Kayak> available = manager.getAvailableKayaks(LocalDate.now());
        System.out.println("Available today:\n" + available.toString() + "\n");

        manager.addLoan(adam, k1, LocalDate.now());
        available = manager.getAvailableKayaks(LocalDate.now());
        System.out.println("Available today:\n" + available.toString() + "\n");

        System.out.println(manager.toString());


        // this will throw an exception
        manager.addLoan(adam, k1, LocalDate.now());

    }

}