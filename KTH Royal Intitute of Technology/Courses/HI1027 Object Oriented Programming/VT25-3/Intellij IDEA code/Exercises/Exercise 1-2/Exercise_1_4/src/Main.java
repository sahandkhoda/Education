/**
 * Uppgift 4, Todo
 * Skriv en klass vars objekt representerar information om en uppgift som ska utföras, Todo. Ett objekt
 * av typen Todo ska ha privata datamedlemmar för
 *  titel (String),
 *  en beskrivning (String),
 *  en tidpunkt då objektet senast uppdaterades (java.time.LocalDateTime),
 *  en flagga (boolean) som anger om uppgiften är utförd eller ej.
 * Konstruktorn ska ha argument för titel och beskrivning. Tiden för senaste uppdatering ska vara tiden
 * då objektet skapas, vilket fås med java.time.LocalDateTime.now(). Flaggan sätts till false (ej utförd).
 * I kontraktet för klassen ingår att
 *  titeln ska ej kunna ändras efter att objektet skapats,
 *  det ska gå att ändra flaggan som markerar om uppgiften är utförd till true,
 *  det ska vara möjligt att lägga till text till beskrivningen och datum för senaste uppdatering
 * ska då uppdateras.
 * Det ska finnas access-metoder för datamedlemmarna samt en egen version av metoden toString.
 * Skriv sedan en main-metod som skapar objekt av typen Todo och testar funktionaliteten.
 */

public class Main {

    public static void main(String[] args) {

        System.out.println();

        Todo todo = new Todo("Do it.", "Just do it.");

        todo.addDescription("I think...");
        todo.addDescription("... or not.");

        System.out.println(todo.toString());
        todo.setCompleted(true);
        System.out.println(todo.toString());

    }

}