import java.time.LocalDate;
import java.util.ArrayList;

public class LoanManager {

    // PRIVATE DATA MEMBERS

    private final ArrayList<Kayak> kayaks;
    private final ArrayList<Loan> loans;


    // CONSTRUCTOR

    public LoanManager() {
        this.kayaks = new ArrayList<>();
        this.loans = new ArrayList<>();
    }


    // PUBLIC MUTATOR METHODS

    public void addKayak(Kayak kayak) {

        // === RELIANCE ON equals() ===
        /*
        This code relies on the equals() method implementation:
            if (!(kayaks.contains(kayak))) {
                kayaks.add(kayak);
            }
        */

        //=== MANUAL COMPARISON ===
        /*
        If no kayak duplicate is found in the list, add kayak to list.
        OBS! Do not add a new copy to the list:
            kayaks.add(new Kayak(kayak.getModel(), kayak.getLevel(), kayak.getNumber(), kayak.getCaretaker()));
        */

        boolean isDuplicate = false;
        for (Kayak k : kayaks) {
            if (k.equals(kayak)) {
                isDuplicate = true;
                break;
            }
        }
        if (!isDuplicate) {
            kayaks.add(kayak);
        }

    }

    public void addLoan(Member borrower, Kayak kayak, LocalDate loanDate) throws IllegalStateException {
        for (Loan loan : loans) {
            if (loan.getKayak().equals(kayak) && loan.getLoanDate().equals(loanDate)) {
                throw new IllegalArgumentException("Kayak is not available at this date!\n");
            }
        }
        loans.add(new Loan(kayak, borrower, loanDate));
    }


    // PUBLIC ACCESS METHODS

    public ArrayList<Kayak> getKayaks() {
        return new ArrayList<>(kayaks);
    }

    public ArrayList<Loan> getLoans() {
        return new ArrayList<>(loans);
    }

    public ArrayList<Loan> getLoansFor(Kayak kayak) {

        // === RELIANCE ON equals() ===
        /*
        This code relies on the equals() method implementation:
            for (Loan loan : loans) {
                if (loan.getKayak().equals(kayak)) {
                    loansForKayak.add(loan);
                }
            }
        */

        //=== MANUAL COMPARISON ===
        /*
        OBS! Do not add a copy:
            loansForKayak.add(new Loan(loan.getKayak(), loan.getBorrower(), loan.getLoanDate()));
        */

        ArrayList<Loan> loansForKayak = new ArrayList<>();
        for (Loan loan : loans) {
            if (loan.getKayak().equals(kayak)) {
                loansForKayak.add(loan);
            }
        }

        // Loan class is immutable; returning a copy is unnecessary.
        return loansForKayak;

    }

    public ArrayList<Kayak> getAvailableKayaks(LocalDate targetDate) {

        ArrayList<Kayak> availableKayaks = new ArrayList<>();
        // One kayak at the time
        for (Kayak k : kayaks) {
            // Check (multiple) loans on the same kayak
            for (Loan loan : loans) {
                // Add to list if same kayak AND same loan date
                if (!(loan.getKayak().equals(k) && targetDate.equals(loan.getLoanDate()))) {
                    availableKayaks.add(k);
                }
                break;
            }
        }
        return availableKayaks;

    }


    // DISPLAY

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder();
        stringBuilder.append("=== LOAN MANAGER ===").append("\n\n");

        for (int i=0; i<kayaks.size(); i++) {
            stringBuilder.append("#").append((i+1)).append(" ").append(kayaks.get(i).toString()).append("\n\n");
        }
        for (int i=0; i<loans.size(); i++) {
            stringBuilder.append("#").append((i+1)).append(" ").append(loans.get(i).toString()).append("\n\n");
        }
        stringBuilder.append("=============\n");

        return stringBuilder.toString();
    }


}