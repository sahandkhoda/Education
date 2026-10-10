public class Vector2D {

    // DATA MEMBERS

    private final double x, y;


    // CONSTRUCTORS

    public Vector2D(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public Vector2D() {
        this(0.0,0.0);
    }


    // PUBLIC MUTATOR METHODS

    public double length() {
        return Math.sqrt(x*x + y*y);
    }

    public Vector2D scale(double factor) {
        return new Vector2D(x*factor, y*factor);
    }

    public Vector2D add(Vector2D v) {
        return new Vector2D(x+v.getX(), y+v.getY());
    }

    public static Vector2D add(Vector2D v1, Vector2D v2) {
        return v1.add(v2);
    }


    // PUBLIC ACCESS METHODS

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    @Override
    public boolean equals(Object o) {

        // Check if same object
        if (this == o) {
            return true;
        }

        if (o instanceof Vector2D) {
            Vector2D other = (Vector2D) o;
            return Math.abs(x-other.getX()) < 0.001 && Math.abs(y-other.getY()) < 0.001;
        }

        return false;
    }

    // DISPLAY
    @Override
    public String toString() {
        return String.format("(%.3f , %.3f)", x, y);
    }
}
