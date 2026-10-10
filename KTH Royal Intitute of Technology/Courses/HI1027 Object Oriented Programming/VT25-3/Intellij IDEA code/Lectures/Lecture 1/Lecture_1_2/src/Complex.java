public class Complex {

    /**  */


    private final double re, im;


    /** CONSTRUCTOR */

    public Complex(double re, double im) {
        this.re = re;
        this.im = im;
    }


    /** ACCESS METHODS */

    public double getRe() {
        return re;
    }

    public double getIm() {
        return im;
    }


    /** MUTATOR METHODS */

    // Addition: (a + bi) + (c + di) = a+c + (b+d)i
    public Complex add(Complex other) {
        return new Complex(this.re + other.getRe(), this.im + other.getIm());
    }

    public Complex add(double re, double im) {
        return new Complex(this.re + re, this.im + im);
    }

    // Multiplication: (a + bi) * (c + di) = (ac-bd) + (ad+bc)i
    public Complex multiply(Complex other) {
        return new Complex(
                (this.re * other.getRe()) - (this.im * other.getIm()),
                (this.re + other.getIm()) + (this.im * other.getRe())
        );
    }

    public Complex multiply(double re, double im) {
        return new Complex(
                (this.re * re) - (this.im * im),
                (this.re * im) + (this.im * re)
        );
    }


    /** OTHER METHODS */

    @Override
    public String toString() {
        return
                "Complex: ( " + re + " + " + im + "i )" + "\n" +
                "Re: " + re + "\n" +
                "Im: " + im + "\n";
    }
}
