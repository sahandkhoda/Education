import java.time.LocalDate;
import java.util.List;

public interface ILoanManager {

    List<Kayak> getKayaks();
    List<Loan> getLoans();

    void addKayak(Kayak kayak);
    void addLoan(Member borrower, Kayak kayak, LocalDate loanDate)
            throws IllegalStateException;

    List<Loan> getLoansFor(Kayak kayak);
    List<Kayak> getAvailableKayaks(LocalDate targetDate);

}
