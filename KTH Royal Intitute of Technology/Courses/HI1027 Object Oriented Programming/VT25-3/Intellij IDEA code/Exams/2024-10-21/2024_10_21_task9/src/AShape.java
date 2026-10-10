public abstract class AShape implements IShape {

    // PRIVATE DATA MEMBERS

    private Point startPoint;
    private final Color color;


    // CONSTRUCTORS

    public AShape(Point startPoint, Color color) {
        this.startPoint = startPoint;
        this.color = color;
    }

    public AShape() {
        this(new Point(0,0), Color.RED);
    }


    // PUBLIC MUTATOR METHODS

    @Override
    public void move(int dx, int dy) {
        startPoint = new Point(startPoint.getX()+dx, startPoint.getY()+dy);
    }

    @Override
    abstract public void draw();


    // PUBLIC ACCESS METHODS

    // Point class is immutable. No need to return a copy.
    public Point getStartPoint() {
        return startPoint;
    }

    // Color is an Enum. No need to return a copy.
    public Color getColor() {
        return color;
    }


    // DISPLAY

    @Override
    public String toString() {
        return  "Color : " + color.toString() + "\n" +
                "Start point : " + startPoint.toString();
    }

}