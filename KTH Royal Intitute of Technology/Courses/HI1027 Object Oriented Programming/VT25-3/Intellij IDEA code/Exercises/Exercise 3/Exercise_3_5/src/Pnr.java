/**
 * An instance of Pnr represents a swedish social security number, personnummer, and is immutable.
 * Instances are created via the static method createPnr.
 */

public class Pnr {

    // PRIVATE DATA MEMBERS

    private final String pnrStr;
    private static final String pnrPattern =  "^(19|20)?[0-9]{6}[- ]?[0-9]{4}$";


    // PRIVATE CONSTRUCTOR

    // Other classes should use createPnr to get a new instance
    private Pnr(String pnrStr) throws IllegalArgumentException {
        this.pnrStr = pnrStr;
    }


    // PUBLIC MUTATOR METHOD

    /**
     * Use this method to create a new instance.
     * (There are no public constructors, because constructors throwing exceptions should be avoided.)
     * @param pnrStr a string representing a "personnummer"
     * @return a new Pnr object
     * @throws IllegalArgumentException if the param does not represent a correct "personnummer"
     */
    public static Pnr createPnr(String pnrStr) throws IllegalArgumentException {
        if (!pnrStr.matches(pnrPattern)) {
            throw new IllegalArgumentException("Invalid PNR string: " + pnrStr);
        }
        return new Pnr(pnrStr);
    }


    // PUBLIC ACCESS METHOD

    public String getPnrStr() {
        return pnrStr;
    }


    // DISPLAY

    @Override
    public String toString() {
        return "PNR: " + pnrStr;
    }

}