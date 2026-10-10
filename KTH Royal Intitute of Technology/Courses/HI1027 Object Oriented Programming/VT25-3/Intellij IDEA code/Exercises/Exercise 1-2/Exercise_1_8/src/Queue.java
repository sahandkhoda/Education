import java.util.Arrays;

public class Queue {

    // PRIVATE DATA MEMBERS

    private String[] strings;
    private int nrOfStrings;


    // CONSTRUCTORS

    public Queue(int size) {
        if (size<1) {
            throw new IllegalArgumentException();
        }
        this.strings = new String[size];
        nrOfStrings = 0;
    }

    public Queue() {
        this(10);
    }


    // PUBLIC MUTATOR METHODS

    public void enqueue(String string) {
        if (nrOfStrings==strings.length) {
            resize();
        }
        strings[nrOfStrings++] = string;
    }

    public String dequeue() {
        String temp = strings[0];
        for (int i=0; i<nrOfStrings-1; i++) {
            strings[i] = strings[i+1];
        }
        nrOfStrings--;
        return "Dequeued : " + temp;
    }

    public String peek() {
        return strings[0];
    }


    // ACCESS METHODS

    public String[] getStrings() {
        return strings.clone();
    }

    public int getNrOfStrings() {
        return nrOfStrings;
    }

    public boolean isEmpty() {
        return nrOfStrings==0;
    }

    public String[] getAll() {
        return strings.clone();
    }


    // DISPLAY

    @Override
    public String toString() {

        StringBuilder stringBuilder = new StringBuilder();
        for (int i=0; i<nrOfStrings; i++) {
            stringBuilder.append("#").append(i+1).append(" : ").append(strings[i]).append("\n");
        }

        return  "\n" +
                "Number of strings : " + nrOfStrings + "\n" +
                "============================" + "\n" +
                stringBuilder;
    }


    // PRIVATE HELP METHOD

    private void resize() {
        String[] temp = new String[nrOfStrings * 2];
        for (int i=0; i<nrOfStrings; i++) {
            temp[i] = strings[i];
        }
        strings = temp;
    }
    
}
