import java.util.Objects;

/**
 * Immutable class.
 */

public class Point {

    // PRIVATE DATA MEMBERS

    private final int x, y;


    // CONSTRUCTOR

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }


    // PUBLIC MUTATOR METHODS

    @Override
    public boolean equals(Object o) {

        // Check if same object
        if (this == o) {
            return true;
        }

        // Check if same class instance
        if (o instanceof Point) {
            Point other = (Point) o;
            return x == other.getX() && y == other.getY();
        }

        // Else...
        return false;

    }

    @Override
    public int hashCode() {
        return Objects.hash(x,y);
    }


    // PUBLIC ACCESS METHODS

    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }


    // DISPLAY

    @Override
    public String toString() {
        return "(" + x + "," + y + ")";
    }

}