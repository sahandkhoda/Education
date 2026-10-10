public class Main {

    public static void main(String[] args) {

        Circle c = new Circle(1,3);
        Shape cs = (Circle) c;
        Rectangle r = new Rectangle();

        Shape[] shapes = new Shape[3];
        shapes[0] = c;
        shapes[1] = cs;
        shapes[2] = r;

        for (Shape shape : shapes) {
            shape.draw();
        }

    }

}