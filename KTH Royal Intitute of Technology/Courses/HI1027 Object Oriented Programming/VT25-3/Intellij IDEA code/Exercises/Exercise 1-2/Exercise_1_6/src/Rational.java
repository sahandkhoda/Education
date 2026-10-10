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

    public float getRational() {
        return (float) num / den;
    }

    // PUBLIC MUTATOR METHODS

    public void setNum(int num) {
        this.num = num;
    }

    public void setDen(int den) {
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
                "Rational    : " + getRational() + "\n";
    }

}
