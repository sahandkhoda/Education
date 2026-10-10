public class Circle extends AShape {

    // PRIVATE DATA MEMBERS

    private final int radius;


    // CONSTRUCTOR

    public Circle(Point startPoint, Color color, int radius) {
        super(startPoint, color);
        if (radius <= 0) {
            throw new IllegalArgumentException("Radius must be greater than 0.");
        }
        this.radius = radius;
    }

    public Circle() {
        super();
        this.radius = 1;
    }


    // PUBLIC MUTATOR METHODS

    @Override
    public void draw() {
        System.out.println("Drawing...\n\n" + toString());
    }


    // PUBLIC ACCESS METHODS

    public int getRadius() {
        return radius;
    }


    // DISPLAY

    @Override
    public String toString() {
        return  "=== CIRCLE ===" + "\n" +
                super.toString() + "\n" +
                "Radius : " + radius;
    }

}