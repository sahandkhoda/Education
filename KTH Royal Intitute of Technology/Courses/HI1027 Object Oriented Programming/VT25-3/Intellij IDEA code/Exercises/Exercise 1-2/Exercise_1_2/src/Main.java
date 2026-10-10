/**
 * Uppgift 2, Account
 * Hämta filen Account3.java, som innehåller definitionen av bankkonto, från föreläsningen. Studera
 * klassen. Lägg till eller ändra följande:
 *  En privat datamedlem, typ long, som representerar kontonumret. Ej ändringsbar.
 *  Ändra konstruktorerna så att ett objekt ges värde på kontonumret när det skapas.
 *  Lägg till en accessmetod för att avläsa kontonumret.
 *  Uppdatera metoden toString().
 * Skriv en main-metod där du skapar några olika Account-objekt och testar:
 */

public class Main {
    public static void main(String[] args) {

        Account account = new Account("Sahand Khodabandehloo", 1000, 12345);
        System.out.println(account.toString());

    }
}

