public class Main {

    public static void main(String[] args) {

        final Complex c1 = new Complex(1, 2);
        final Complex c2 = new Complex(-3, 1);

        final Complex a = c1.add(-3, 1);
        final Complex m = c1.multiply(c2);

        System.out.println(a.toString());
        System.out.println(m.toString());

    }

}