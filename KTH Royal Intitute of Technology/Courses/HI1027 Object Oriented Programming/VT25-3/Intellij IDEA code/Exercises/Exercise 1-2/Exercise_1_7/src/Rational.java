public class Rational {

    // PRIVATE DATA MEMBERS

    private int num, den;


    // CONSTRUCTORS

    public Rational(int num, int den) {
        if (den == 0) {
            throw new IllegalArgumentException();
        }
        this.num = num;
        this.den = den;
        reduce();
    }

    public Rational(int num) {
        this(num, 1);
    }

    public Rational() {
        this(0,1);
    }


    // ACCESS METHODS

    public int getNum() {
        return num;
    }

    public int getDen() {
        return den;
    }

    public float getQuotient() {
        return ((float) num / den) ;
    }

    // PUBLIC MUTATOR METHODS

    public void setNum(int num) {
        this.num = num;
    }

    public void setDen(int den) {
        if (den == 0) {
            throw new IllegalArgumentException();
        }

        this.den = den;
    }

    public Rational add(Rational other) {
        int newNum = (this.num * other.den) + (this.den * other.num);
        int newDen = this.den * other.den;
        return new Rational(newNum, newDen);
    }

    public Rational add(int other) {
        return add(new Rational(other, 1));
    }

    // DISPLAY

    @Override
    public String toString() {
        return  "Numerator   : " + num + "\n" +
                "Denominator : " + den + "\n" +
                "Quotient    : " + getQuotient() + "\n";
    }

    // PRIVATE HELP METHOD

    // Greatest Common Divisor
    private int gcd(int m, int n) {

        m = Math.abs(m);
        n = Math.abs(n);
        while(m != n) {
            if (m > n) {
                m -= n;
            } else {
                n -= m;
            }
        }

        return m;

    }

    // PRIVATE HELP METHOD

    private void reduce() {

        if (num != 0) {
            int gcd = gcd(num, den);
            num /= gcd;
            den /= gcd;
        }

        if (den < 0) {
            den *= -1;
        }

    }

}
