public class Text implements Comparable<Text> {

    // PRIVATE DATA MEMBERS

    private final char[] text;


    // CONSTRUCTORS

    public Text(char[] chars) throws IllegalArgumentException {
        if (chars == null) {
            throw new IllegalArgumentException("chars is empty!");
        }
        this.text = new char[chars.length];
        for (int i = 0; i < chars.length; i++) {
            text[i] = chars[i];
        }
    }

    public Text(String string) throws IllegalArgumentException {
        if (string == null) {
            throw new IllegalArgumentException("string is empty!");
        }
        this.text = string.toCharArray();
    }


    // PUBLIC MUTATOR METHODS

    public char charAt(int index) {
        if (index < 0 || index >= text.length) {
            throw new IndexOutOfBoundsException("Index = " + index);
        }
        // Return (immutable) char at given index. No copy needed.
        return text[index];
    }

    public Text replace(char oldCh, char newCh) {
        char[] temp = new char[text.length];
        for (int i = 0; i < text.length; i++) {
            if (text[i] == oldCh) {
                temp[i] = newCh;
            } else {
                temp[i] = text[i];
            }
        }
        return new Text(temp);
    }

    public Text concat(Text other) {
        char[] concatChars = new char[this.getLength() + other.getLength()];

        for (int i = 0; i < this.getLength(); i++) {
            concatChars[i] = text[i];
        }

        for (int i = 0; i < other.getChars().length; i++) {
            concatChars[i+this.getLength()] = other.getChars()[i];
        }

        return new Text(concatChars);
    }

    @Override
    public int compareTo(Text other) {

        // The shortest length to compare characters.
        int minLength;
        if (this.getLength() < other.getLength()) {
            minLength = this.getLength();
        } else {
            minLength = other.getLength();
        }

        // Compare one char at a time.
        for (int i = 0; i < minLength; i++) {
            int diff = this.getChars()[i] - other.getChars()[i];
            if (diff != 0) {
                return diff;
            }
        }

        // Same chars up until minLength --> The shortest comes first.
        return this.getLength() - other.getLength();
    }

    @Override
    public boolean equals(Object o) {

        // Check if same object
        if (this == o) {
            return true;
        }

        // Check if same class reference
        if (o instanceof Text) {
            Text other = (Text) o;
            return this.compareTo(other) == 0;
        }

        return false;
    }


    // PUBLIC ACCESS METHODS

    public int getLength() {
        return text.length;
    }

    public char[] getChars() {
        // char may be a primitive data type, but char[] is not! Return a copy.
        char[] copy = new char[text.length];
        for (int i = 0; i < text.length; i++) {
            copy[i] = text[i];
        }
        return copy;
    }


    // DISPLAY

    public String toString() {
        return new String(text);
    }

}