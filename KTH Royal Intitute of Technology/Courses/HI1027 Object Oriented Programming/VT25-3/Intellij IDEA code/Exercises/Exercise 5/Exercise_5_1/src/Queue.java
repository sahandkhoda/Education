public class Queue<T> {

    // PRIVATE DATA MEMBERS

    private T[] queue;
    private int nrOfElements;


    // CONSTRUCTORS

    public Queue(int initialCapacity) throws IllegalArgumentException {
        if (initialCapacity <= 0) {
            throw new IllegalArgumentException("Initial capacity must be greater than 0.\n");
        }
        queue = (T[]) new Object[initialCapacity];
        nrOfElements = 0;
    }

    public Queue() {
        this(10);
    }


    // PUBLIC MUTATOR METHODS

    public boolean isEmpty() {
        return nrOfElements == 0;
    }

    public void enQueue(T newElement) {
        if (nrOfElements >= queue.length) {
            resize();
        }
        queue[nrOfElements++] = newElement;
    }

    public T deQueue() {

        if (nrOfElements <= 0) {
            throw new IllegalArgumentException("Queue is empty!\n");
        }

        // Before removal, the first element is stored.
        T temp = queue[0];

        // A new array with the same capacity is created.
        // However, the first element is removed by shifting the remaining elements.
        queue = copy(1, queue.length);
        nrOfElements--;
        return temp;
    }


    // PUBLIC ACCESS METHODS

    public T[] getAll(T[] arr) {

        // Check array length.
        if (arr.length < nrOfElements) {
            throw new IllegalArgumentException("Length of array is less than active elements.\n");
        }

        // Copy active elements.
        for (int i = 0; i < nrOfElements; i++) {
            arr[i] = queue[i];
        }

        // Clean up rest of array
        for (int j = nrOfElements; j < queue.length; j++) {
            arr[j] = null;
        }

        // Return the same array reference to preserve the caller's runtime type (T[]),
        // since using a newly created Object[] would lose the type information.
        return arr;
    }

    public int size() {
        return nrOfElements;
    }

    public T peek() {
        if (isEmpty()) {
            throw new IllegalArgumentException("Queue is empty.");
        }

        /*
        Since copy() returns a copy of the references to the objects, i.e., not a deep copy,
        it is unnecessary to: return copy(0,1)[0];
        */
        return queue[0];
    }


    // DISPLAY

    @Override
    public String toString() {
        StringBuilder stringBuilder = new StringBuilder("\n");
        for (int i = 0; i < nrOfElements; i++) {
            stringBuilder.append(queue[i]).append("\n");
        }
        return stringBuilder.toString();
    }


    // PRIVATE HELP METHODS

    private void resize() {
        // Double the capacity while preserving the active elements.
        // The original array will be Garbage Collected...
        queue = copy(0, queue.length*2);
    }

    private T[] copy(int startIndex, int capacity) {

        if (startIndex < 0 || startIndex > nrOfElements) {
            throw new IllegalArgumentException("Start index is out of bounds.\n");
        }
        if (capacity <= 0) {
            throw new IllegalArgumentException("Capacity must be greater than 0.\n");
        }

        int availableElements = nrOfElements - startIndex;
        int elementsToCopy;
        if (availableElements < capacity) {
            elementsToCopy = availableElements;
        } else {
            elementsToCopy = capacity;
        }

        // NOTE: A copy of the array (reference) but not a deep copy (of the objects)!
        T[] copy = (T[]) new Object[capacity];
        for (int i = 0; i < elementsToCopy; i++) {
            copy[i] = queue[i+startIndex];
        }
        return copy;

    }

}