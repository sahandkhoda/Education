import java.util.ArrayList;

public class Group implements IShape {

    // PRIVATE DATA MEMBERS

    private final ArrayList<IShape> shapes;


    // CONSTRUCTOR

    public Group() {
        shapes = new ArrayList<>();
    }


    // PUBLIC MUTATOR METHODS

    public void add(IShape shape) {
        if (!shapes.contains(shape)) {
            shapes.add(shape);
        }
    }

    @Override
    public void move(int dx, int dy) {
        for (IShape shape : shapes) {
            shape.move(dx,dy);
        }
    }

    @Override
    public void draw() {
        System.out.println("\n" + "Drawing...\n\n" + toString());
    }


    // PUBLIC ACCESS METHODS

    public ArrayList<IShape> getShapes() {
        return new ArrayList<>(shapes);
    }


    // DISPLAY

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("GROUP").append("\n").append("[").append("\n");
        for (IShape shape : shapes) {
            sb.append(shape.toString()).append("\n");
        }
        sb.append("]");
        return sb.toString();
    }

}