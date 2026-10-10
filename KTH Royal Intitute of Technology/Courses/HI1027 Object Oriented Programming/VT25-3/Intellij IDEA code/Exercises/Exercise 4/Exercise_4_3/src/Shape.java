public abstract class Shape implements Movable {

    // PRIVATE DATA MEMBERS

    private int x1, y1;


    // CONSTRUCTORS

    public Shape(int x0, int y0) {
        this.x1 = x0;
        this.y1 = y0;
    }

    public Shape() {
        this(0,0);
    }


    // PUBLIC MUTATOR METHODS

    public void setX1(int x1) {
        if (x1 < 0) {
            x1 = 0;
        }
        this.x1 = x1;
    }

    public void setY1(int y1) {
        if (y1 < 0) {
            y1 = 0;
        }
        this.y1 = y1;
    }

    public abstract void draw();

    // PUBLIC ACCESS METHODS

    public int getX1() {
        return x1;
    }

    public int getY1() {
        return y1;
    }


    // DISPLAY

    @Override
    public String toString() {
        return  "(x1,y1) = (" + x1 + "," + y1 + ")";
    }

}