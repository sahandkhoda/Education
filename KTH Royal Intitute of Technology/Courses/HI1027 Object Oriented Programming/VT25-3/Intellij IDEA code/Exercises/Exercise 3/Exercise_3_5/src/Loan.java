import java.time.LocalDate;

public class Loan {

    // PRIVATE DATA MEMBERS

    private final Kayak kayak;
    private final Member borrower;
    private final LocalDate loanDate;


    // CONSTRUCTOR

    public Loan(Kayak kayak, Member borrower, LocalDate loanDate) {
        this.kayak = kayak;
        this.borrower = borrower;
        this.loanDate = loanDate;
    }


    // PUBLIC ACCESS METHODS

    public Kayak getKayak() {
        return new Kayak(kayak.getModel(), kayak.getLevel(), kayak.getNumber(), kayak.getCaretaker());
    }

    public Member getBorrower() {
        return new Member(borrower.getFullName(), borrower.getPnr());
    }

    public LocalDate getLoanDate() {
        return loanDate;
    }


    // PUBLIC MUTATOR METHOD

    @Override
    public boolean equals(Object o) {

        // Check if the same object reference
        if (this == o) {
            return true;
        }

        // Check for null and ensure the classes match
        if (o == null || this.getClass() != o.getClass()) {
            return false;
        }

        // Cast to Kayak so we can compare fields
        Loan other = (Loan) o;
        return  kayak.equals(other.getKayak()) &&
                borrower.equals(other.getBorrower()) &&
                loanDate.equals(other.getLoanDate());

    }


    // DISPLAY

    @Override
    public String toString() {
        return  "Loan date: " + loanDate        + "\n" +
                kayak.getModel()                + "\n" +
                borrower.toString();
    }

}