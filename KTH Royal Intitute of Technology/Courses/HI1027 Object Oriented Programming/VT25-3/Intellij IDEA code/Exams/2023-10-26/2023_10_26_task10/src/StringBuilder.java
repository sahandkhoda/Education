public class StringBuilder {

    // PRIVATE DATA MEMBERS

    private char[] chars;
    private int nrOfChars;

    // CONSTRUCTOR

    public StringBuilder(String string) {
        nrOfChars = 0;
        chars = new char[string.length()];
        for (int i = 0; i < string.length(); i++) {
            chars[i] = string.toCharArray()[i];
            nrOfChars++;
        }
    }

    public StringBuilder() {
        chars = new char[10];
        nrOfChars = 0;
    }


    // PUBLIC MUTATOR METHODS

    public char charAt(int index) throws IndexOutOfBoundsException {
        if (index < 0 || index >= nrOfChars) {
            throw new IndexOutOfBoundsException("index is out of bounds.");
        }
        return chars[index];
    }

    public void append(char c) {
        expandIfNeeded(1);
        chars[nrOfChars++] = c;
    }

    public void append(String s) {
        expandIfNeeded(s.length());
        for (int i = 0; i < s.length(); i++) {
            chars[nrOfChars++] = s.toCharArray()[i];
        }
    }


    // PUBLIC ACCESS METHODS

    public int length() {
        return nrOfChars;
    }

    public int capacity() {
        return chars.length;
    }


    // DISPLAY

    @Override
    public String toString() {
        return new String(chars, 0, nrOfChars);
    }


    // PRIVATE HELP METHODS

    private void expandIfNeeded(int extra) {
        if (extra + nrOfChars > chars.length) {
            resize(extra + nrOfChars);
        }
    }

    private void resize(int neededCapacity) {
        char[] temp = new char[neededCapacity*2];
        for (int i = 0; i < nrOfChars; i++) {
            temp[i] = chars[i];
        }
        chars = temp;
    }

}