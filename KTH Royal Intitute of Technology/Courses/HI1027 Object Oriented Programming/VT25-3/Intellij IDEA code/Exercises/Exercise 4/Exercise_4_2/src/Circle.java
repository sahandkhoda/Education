public class Circle extends Shape {

    // PRIVATE DATA MEMBER

    private int radius;


    // CONSTRUCTOR

    public Circle(int x1, int y1, int radius) {
        super(x1, y1);
        this.radius = radius;
    }

    public Circle(int x1, int y1) {
        this(x1,y1,1);
    }

    public Circle() {
        this(0,0,1);
    }


    // PUBLIC MUTATOR METHODS

    public void setRadius(int radius) {
        this.radius = radius;
    }

    @Override
    public void draw() {
        System.out.println("Faking draw...");
        System.out.println(this.toString() + "\n");
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