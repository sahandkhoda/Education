public class Line extends AShape {

    // PRIVATE DATA MEMBER

    private Point endPoint;


    // CONSTRUCTORS

    public Line(Point startPoint, Color color, Point endPoint) {
        super(startPoint, color);
        if (endPoint.equals(super.getStartPoint())) {
            throw new IllegalArgumentException("Start- and end points must be different!");
        }
        this.endPoint = endPoint;
    }

    public Line() {
        super();
        this.endPoint = new Point(10,10);
    }


    // PUBLIC MUTATOR METHODS

    @Override
    public void move(int dx, int dy) {
        // Move start point.
        super.move(dx,dy);
        // Move end point.
        endPoint = new Point(endPoint.getX()+dx, endPoint.getY()+dy);
    }

    @Override
    public void draw() {
        System.out.println("Drawing...\n\n" + toString());
    }


    // PUBLIC ACCESS METHODS

    // Point class is immutable. No need to return a copy.
    public Point getEndPoint() {
        return endPoint;
    }


    // DISPLAY

    @Override
    public String toString() {
        return  "=== LINE ===" + "\n" +
                super.toString() + "\n" +
                "End point   : " + endPoint.toString();
    }

}