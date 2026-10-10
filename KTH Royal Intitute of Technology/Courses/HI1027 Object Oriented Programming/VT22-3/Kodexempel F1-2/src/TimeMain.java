/*
 * Creating and manipulating Time objects.
 */
public class TimeMain {

    public static void main(String[] args) {

        Time time1 = new Time(12, 15, 75);
        Time time2 = new Time(23, 48);
        Time time3 = new Time();

        System.out.println(time1.toString() + "   " + time2.toString() + "   " + time3.toString());

        // tic, tac...
        for(int i = 0; i < 10; i++) {
            time1.tic(10);
            time2.tic(7);
            time3.tic();
            System.out.println(time1.toString() + "   " + time2.toString() + "   " + time3.toString());
        }
    }
}
