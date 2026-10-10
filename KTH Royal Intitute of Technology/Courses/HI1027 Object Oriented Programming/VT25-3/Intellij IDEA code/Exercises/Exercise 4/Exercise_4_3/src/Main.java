public class Main {

    public static void main(String[] args) {

        Movable[] movables = new Movable[2];
        movables[0] = new Circle();
        movables[1] = new Rectangle(0,0,1,1);

        for (Movable movable : movables) {

            movable.move(1,1);
            movable.move(1,3);

            // Since draw() is not included in Movable, this line will give an error.
            // movable.draw();

            System.out.println(movable.toString() + "\n");
        }



    }

}