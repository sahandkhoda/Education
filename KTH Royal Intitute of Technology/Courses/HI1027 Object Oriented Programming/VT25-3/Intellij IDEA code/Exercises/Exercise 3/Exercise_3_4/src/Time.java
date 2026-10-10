public class Time {

    // PRIVATE DATA MEMBERS

    private int h, m, s;


    // CONSTRUCTOR

    public Time(int h, int m, int s) {
        this.h = h;
        this.m = m;
        this.s = s;
        adjust();
    }

    public Time(int h, int m) {
        this(h, m, 0);
    }


    // MUTATOR METHODS

    public void tic(int h, int m, int s) {
        this.h += h;
        this.m += m;
        this.s += s;
        adjust();
    }

    public void tic(int m, int s) {
        tic(0, m, s);
    }

    public void tic(int s) {
        tic(0, 0, s);
    }


    // ACCESS METHODS

    public int getH() {
        return h;
    }

    public int getM() {
        return m;
    }

    public int getS() {
        return s;
    }


    // DISPLAY

    public String toString() {
        return String.format("%02d:%02d:%02d", h, m, s);
    }


    // PRIVATE HELP METHOD

    private void adjust() {
        m += s / 60;
        h += m / 60;

        s %= 60;
        m %= 60;
        h %= 24;
    }

}
