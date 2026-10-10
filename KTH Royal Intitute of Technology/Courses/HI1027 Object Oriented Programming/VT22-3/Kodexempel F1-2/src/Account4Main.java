public class Account4Main {

    public static void main(String[] args) {

        Account4 anders = new Account4("Anders", 1000);
        Account4 ibrahim = new Account4("Ibrahim", 1000.0);

        Account4.setInterest(0.50);

        // preferred way to call a static method
        System.out.printf("Current interest: %.2f\n", Account4.getInterest());

        // discouraged, but will show the same result (class data)
        System.out.printf("Current interest: %.2f\n", anders.getInterest());
        System.out.printf("Current interest: %.2f\n", ibrahim.getInterest());
    }
}
