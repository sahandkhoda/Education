public class Member {

    // PRIVATE DATA MEMBERS

    private final String fullName;
    private final Pnr pnr;


    // CONSTRUCTOR

    public Member(String fullName, Pnr pnr) {
        this.fullName = fullName;
        this.pnr = pnr;
    }


    // PUBLIC ACCESS METHODS

    public String getFullName() {
        return fullName;
    }

    public Pnr getPnr() {
        return pnr;
    }


    // PUBLIC MUTATOR METHOD

    @Override
    public boolean equals(Object o) {

        // Check if the same object reference
        if (this == o) {
            return true;
        }

        // Check for null and ensure the classes match
        if (o == null || this.getClass() != o.getClass()) {
            return false;
        }

        // Cast to Member so we can compare fields
        Member other = (Member) o;
        return  fullName.equals(other.getFullName()) &&
                pnr.getPnrStr().equals(other.getPnr().getPnrStr());
    }

    // DISPLAY

    @Override
    public String toString() {
        return  "Full name: " + fullName + " (" + pnr.toString() + ")";
    }

}