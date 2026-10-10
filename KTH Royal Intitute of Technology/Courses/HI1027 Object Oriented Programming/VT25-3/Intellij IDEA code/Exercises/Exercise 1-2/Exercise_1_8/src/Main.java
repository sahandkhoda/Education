public class Main {

    public static void main(String[] args) {

        Queue q1 = new Queue(3);
        q1.enqueue("Hej");
        q1.enqueue("Hur mår du?");
        q1.enqueue("Tack, det är bra!");
        q1.enqueue("Hejdå!!!");

        System.out.println(q1.toString());
        System.out.println(q1.dequeue());
        System.out.println(q1.dequeue());
        System.out.println(q1.dequeue());
        System.out.println(q1.toString());

    }

}