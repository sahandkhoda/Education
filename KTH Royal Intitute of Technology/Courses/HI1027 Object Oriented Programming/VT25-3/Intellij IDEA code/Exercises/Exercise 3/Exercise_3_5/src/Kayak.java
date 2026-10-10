public class Kayak {

    // PRIVATE DATA MEMBERS

    private final String model;
    private final KLevel level;
    private final long number;
    private Member caretaker;


    // CONSTRUCTOR

    public Kayak(String model, KLevel level, long number, Member caretaker) {
        this.model = model;
        this.level = level;
        this.number = number;
        this.caretaker = caretaker;
    }


    // PUBLIC MUTATOR METHODS

    public void setCaretaker(Member newCaretaker) {
        caretaker = newCaretaker;
    }


    // PUBLIC ACCESS METHODS

    public String getModel() {
        return model;
    }

    public KLevel getLevel() {
        return level;
    }

    public long getNumber() {
        return number;
    }

    public Member getCaretaker() {
        return caretaker;
    }


    // PUBLIC MUTATOR METHODS

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

        // Cast to Kayak so we can compare fields
        Kayak other = (Kayak) o;
        return  model.equals(other.getModel()) &&
                level == other.getLevel() &&
                number == other.getNumber() &&
                caretaker.equals(other.getCaretaker());

    }

    // DISPLAY

    @Override
    public String toString() {
        return  "--- KAYAK ---"         + "\n" +
                "Model: " + model       + "\n" +
                "Level: " + level       + "\n" +
                "Number: " + number     + "\n" +
                caretaker.toString();
    }

}