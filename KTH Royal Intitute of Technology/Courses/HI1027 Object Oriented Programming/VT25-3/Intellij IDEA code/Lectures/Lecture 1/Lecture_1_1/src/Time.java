public class Time {

    /** DATA MEMBERS */

    private int s, m, h;

    /** CONSTRUCTORS */

    public Time(int s, int m, int h) {
        this.s = s;
        this.m = m;
        this.h = h;
        adjust();
    }

    public Time(int m, int h) {
        this(0, m, h);
    }


    /** ACCESS METHODS */

    public int getS() {
        return s;
    }

    public int getM() {
        return m;
    }

    public int getH() {
        return h;
    }


    /** MUTATOR METHODS */

    public void tic(int s) {
        this.s += s;
        adjust();
    }

    public void tic() {
        tic(1);
    }


    /** OTHER METHODS */

    @Override
    public String toString() {

        return String.format("[%02d:%02d:%02d]", s, m, h);

    }

    /** PRIVATE HELPER METHODS */

    private void adjust() {

        m += s / 60;
        h += m / 60;

        s %= 60;
        m %= 60;
        h %= 24;

    }

}
