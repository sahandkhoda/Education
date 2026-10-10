public class Rectangle extends Shape {

    // PRIVATE DATA MEMBERS

    private int x2, y2;

    // CONSTRUCTOR

    public Rectangle(int x1, int y1, int x2, int y2) {
        super(x1, y1);
        this.x2 = x2;
        this.y2 = y2;
    }

    public Rectangle() {
        this(0,0,1,1);
    }


    // PUBLIC MUTATOR METHODS

    public void setX2(int x2) {
        if (x2 == getX1())
            this.x2 = x2;
    }

    public void setY2(int y2) {
        this.y2 = y2;
    }

    @Override
    public void draw() {
        System.out.println("Faking draw...");
        System.out.println(this.toString());
    }

    @Override
    public void move(int dx, int dy) {
        setX1(getX1() + dx);
        setY1(getY1() + dy);
        this.setX2(x2 + dx);
        this.setY2(y2 + dy);
    }


    // PUBLIC ACCESS METHODS

    public int getX2() {
        return x2;
    }

    public int getY2() {
        return y2;
    }


    // DISPLAY

    @Override
    public String toString() {
        return  "=== RECTANGLE ===" + "\n" +
                super.toString() + "\n" +
                "(x2,y2) = (" + x2 + "," + y2 + ")";
    }


    // PRIVATE HELP METHODS


}