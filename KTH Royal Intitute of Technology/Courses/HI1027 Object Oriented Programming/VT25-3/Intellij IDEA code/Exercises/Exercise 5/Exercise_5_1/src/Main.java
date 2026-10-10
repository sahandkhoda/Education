public class Main {

    public static void main(String[] args) {

        // Create a Queue with a small initial capacity to test resizing.
        Queue<String> queue = new Queue<>(3);
        System.out.println("Initially, is the queue empty? " + queue.isEmpty());

        // Enqueue some elements.
        queue.enQueue("Alice");
        queue.enQueue("Bob");
        queue.enQueue("Charlie");
        System.out.println("\n" + "After enqueueing 3 elements:");
        System.out.println(queue);
        System.out.println("Current size: " + queue.size());

        // Peek at the front element.
        System.out.println("Peek: " + queue.peek());

        // Dequeue an element.
        String removed = queue.deQueue();
        System.out.println("\n" + "Dequeued element: " + removed);
        System.out.println("After dequeuing:");
        System.out.println(queue);
        System.out.println("Current size: " + queue.size());

        /*
        // Test getAll(T[] arr) using an array that's too small.
        String[] smallArray = new String[2];
        String[] allFromSmall = queue.getAll(smallArray);
        System.out.println("\n" + getAll() with a small array: " + java.util.Arrays.toString(allFromSmall));
        */

        // Test getAll(T[] arr) using an array larger than needed.
        String[] largeArray = new String[5];
        String[] allFromLarge = queue.getAll(largeArray);
        System.out.println("getAll() with a large array: " + java.util.Arrays.toString(allFromLarge));

        // Enqueue more elements to force a resize.
        queue.enQueue("David");
        queue.enQueue("Eve");
        queue.enQueue("Frank");
        System.out.println("\nAfter enqueueing 3 more elements (triggering a resize if needed):");
        System.out.println(queue);
        System.out.println("Current size: " + queue.size());

    }

}