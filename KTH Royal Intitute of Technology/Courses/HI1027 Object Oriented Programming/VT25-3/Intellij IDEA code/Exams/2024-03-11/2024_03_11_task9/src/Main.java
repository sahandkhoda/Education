public class Main {
    public static void main(String[] args) {

        Vector2D v1 = new Vector2D(1,1);
        Vector2D v2 = new Vector2D(2,3);

        Vector2D v3 = v1.add(v2);
        Vector2D v4 = Vector2D.add(v1,v2);

        System.out.println(v1.toString());
        System.out.println(v2.toString());
        System.out.println(v3.toString());
        System.out.println(v4.toString());

    }
}