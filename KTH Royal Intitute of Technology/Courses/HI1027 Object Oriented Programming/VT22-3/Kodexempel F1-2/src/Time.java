/*
 * An instance of the class Time represents a point
 * in time, where h, m and s always are adjusted
 * in the intervals 0-23 and 0-59. 
 */
public class Time {

    private int h, m, s;

    // Constructors, overloaded
    public Time(int h, int m, int s) {
        if (h < 0 || m < 0 || s < 0) throw new IllegalArgumentException();
        this.h = h;
        this.m = m;
        this.s = s;
        adjust();
    }

    public Time(int h, int m) { this(h, m, 0); }
    public Time(int h)        { this(h,0,0); }
    public Time()             { this(0,0,0); }

    // Mutators
    // The method tic is overloaded
    public void tic(int s) {
        if (s < 0) throw new IllegalArgumentException();
        this.s += s;
        adjust();
    }

    public void tic() {
        tic(1);
    }

    // Private helper method, adjusting the values of h, m and s.
    private void adjust() {
        m += s / 60;
        h += m / 60;
        // "%" calculates the remainder (modulus)
        s = s % 60;
        m = m % 60;
        h = h % 24;
    }

    // Access methods
    public int getHours() {return h;}
    public int getMinutes() {return m;}
    public int getSeconds() {return s;}

    @Override
    public String toString() {
        String info
                = String.format("%02d", h) + ":"
                + String.format("%02d", m) + ":"
                + String.format("%02d", s);
        return info;
    }
}
