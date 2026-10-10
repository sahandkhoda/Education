public class Main {

    public static void main(String[] args) {

        Group group1 = new Group();
        group1.add(new Line(new Point(3,2), Color.BLUE, new Point(5,2)));
        group1.add(new Circle(new Point(0,0), Color.GREEN, 50));
        group1.move(1,3);

        Group group2 = new Group();
        group2.add(new Line());
        group2.add(new Circle());
        group2.move(10,20);

        Group group3 = new Group();
        group3.add(group1);
        group3.add(group2);
        group3.draw();
        group3.move(1,1);
        group3.draw();

    }

}