public class GenericStack<E> {

    // PRIVATE DATA MEMBERS

    private E[] elements;
    private int n;


    // CONSTRUCTOR

    public GenericStack(int initialCapacity) {
        elements = (E[]) new Object[initialCapacity];
        n = 0;
    }


    // PUBLIC MUTATOR METHODS

    public void add(E object) {
        if (isFull()) {
            expand();
        }
        elements[n++] = object;
    }


    // PUBLIC ACCESS METHODS

    public int getN() {
        return n;
    }

    public E getObject(int index) throws IllegalArgumentException {
        if (!isAllowedIndex(index)) {
            throw new IllegalArgumentException("Invalid index!");
        }
        return elements[index];
    }

    public E[] getObjects() {
        E[] copy = (E[]) new Object[elements.length];
        for (int i=0; i<elements.length; i++) {
            copy[i] = elements[i];
        }
        return copy;
    }


    // DISPLAY


    // PRIVATE HELP METHODS

    private boolean isFull() {
        return n >= elements.length;
    }

    private void expand() {
        E[] temp = (E[]) new Object[elements.length*2];
        for (int i=0; i<elements.length; i++) {
            temp[i] = elements[i];
        }
        elements = temp;
    }

    private boolean isAllowedIndex(int index) {
        return index < n;
    }

}