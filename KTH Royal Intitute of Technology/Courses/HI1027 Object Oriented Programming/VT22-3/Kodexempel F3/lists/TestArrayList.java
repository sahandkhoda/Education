package lists;

/**
 * The Collections Framework (in package java.util) provides classes for storing
 * and managing collections of objects.
 *
 * Classes in the Collections Framework is implemented using generics.
 */
import java.util.ArrayList;
import java.util.Collections; // static methods for e.g. sorting

public class TestArrayList {

    public static void main(String[] args) {

        // Some skilled musicians
        String vocals = new String("Robert Plant");
        String guitar = new String("Jimmy Page");
        String bass = new String("John Paul Jones");
        String drums = new String("John Bonham");

        /* An ArrayList for storing String objects
         */
        ArrayList<String> band = new ArrayList<>();
        band.add(vocals);
        band.add(guitar);
        band.add(bass);
        band.add(drums);

        System.out.println(band.toString());
        System.out.println("Size of band: " + band.size() + "\n");

        /* "get" returns a reference to the specified object, without
		 * removing it from the list.
         */
        String artist = band.get(3);
        System.out.println(artist + "\n");

        /* remove an object from the list (sad but true)
         */
        int index = band.indexOf(drums);
        artist = band.remove(index);
        System.out.println("RIP: " + artist + "\n");

        for (String s : band) {
            System.out.println(s);
        }
        System.out.println("Size of band: " + band.size() + "\n");

        /* The method Collections.sort is static
         */
        Collections.sort(band);
        for (String s : band) {
            System.out.println(s);
        }
        System.out.println("Size of band: " + band.size() + "\n");

        // Once again: sad but true
        band.clear();

        for (String s : band) {
            System.out.println(s);
        }
        System.out.println("Size of band: " + band.size() + "\n");
    }
}
