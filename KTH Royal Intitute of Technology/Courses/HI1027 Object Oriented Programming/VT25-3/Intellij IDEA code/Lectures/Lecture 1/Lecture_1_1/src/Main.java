public class Main {

    public static void main(String[] args) {

        Time time = new Time(57,139, 10);

        if (time.getS() < 0 || time.getM() < 0 || time.getH() < 0) {
            throw new IllegalArgumentException();
        }

        System.out.println(time.toString());
        time.tic(3);
        System.out.println(time.toString());

    }

}