/**
 * === Uppgift 3, Patient ===
 * Skriv en klass, Patient, som representerar en patient med en journal. Klassen ska ha tre privata
 * datamedlemmar för namn (String), personnummer (string) samt en journal (String).
 * I kontraktet ingår att
 *  namn och personnummer ska inte kunna ändras efter att objektet skapats,
 *  det ska gå att lägga till en text/anteckning till journalen – varje gång denna metod anropas
 * ska även datumet för den nya anteckningen läggas till.
 * Använd klassen LocalDate för att representera datumet (importera java.time.LocalDate) och
 * använd klassmetoden LocalDate.now() för att genrera ett objekt med aktuellt datum.
 * Konstruktorn ska ha argument för namn och personnummer; journaltexten ska initialt sättas till ””
 * (en tom textsträng).
 * I övrigt ska klassen ha access-metoder för alla datamedlemmar samt en egen version av metoden
 * toString.
 * Skriv även en main-metod där du skapar objekt av typen Patient och testar funktionaliteten.
 */

public class Main {

    public static void main(String[] args) {

        Patient p = new Patient("Sahand Khodabandehloo", "123456");
        p.addJournalEntry("Hello");
        p.addJournalEntry("Bye");
        System.out.println(p.toString());

    }
}