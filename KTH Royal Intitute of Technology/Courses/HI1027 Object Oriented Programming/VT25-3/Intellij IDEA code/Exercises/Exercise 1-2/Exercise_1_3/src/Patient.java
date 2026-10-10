import java.time.LocalDate;

public class Patient {

    private final String name, SSN;
    private String journal;

    public Patient(String name, String SSN) {

        this.name = name;
        this.SSN = SSN;
        this.journal = "";

    }

    public String getName() {
        return name;
    }

    public String getSSN() {
        return SSN;
    }

    public String getJournal() {
        return journal;
    }

    public void addJournalEntry(String newJournalEntry) {
        this.journal +=
                LocalDate.now() + "\n" +
                newJournalEntry + "\n";
    }

    @Override
    public String toString() {
        return
                "NAME: " + name + "\n" +
                "SSN: " + SSN + "\n" +
                "=== JOURNAL ===\n" + journal;
    }

}
