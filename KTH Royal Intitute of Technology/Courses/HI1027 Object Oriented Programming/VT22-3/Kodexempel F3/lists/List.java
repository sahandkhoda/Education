package lists;

/**
 * An example of a simplified implementation of an array list. In practice, use
 * java.util.ArrayList instead.
 *
 * @author Anders Lindström, anderslm@kth.se
 *
 */
public class List {

    private String[] arr;
    private int n; // number of elements

    public List(int capacity) {
        if (capacity <= 0) {
            capacity = 10;
        }
        arr = new String[capacity];
        n = 0;
    }

    public int size() {
        return n;
    }

    public String get(int index) {
        return arr[index];
    }

    public void add(String s) {
        if (arr.length <= n) {
            resize();
        }
        arr[n++] = s;
    }

    public String remove(int index) {
        String s = arr[index];
        pack(index);
        return s;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder("[");
        if (n > 0) {
            builder.append(arr[0]);
        }
        for (int i = 1; i < n; i++) {
            builder.append("; ").append(arr[i]);
        }
        builder.append("]");
        return builder.toString();
    }

    private void resize() {
        String[] tmp = new String[arr.length * 2];
        for (int i = 0; i < arr.length; i++) {
            tmp[i] = arr[i];
        }
        arr = tmp;

    }

    private void pack(int index) {
        for (int i = index; i < n - 1; i++) {
            arr[i] = arr[i + 1];
        }
        n--;
    }

    public static void main(String[] args) {
        List list = new List(2);

        list.add("Hey");
        list.add("Ho");
        list.add("Silver");
        System.out.println(list);
        list.remove(1);
        System.out.println(list);
        list.remove(0);
        System.out.println(list);
        list.remove(0);
        System.out.println(list);
    }
}
