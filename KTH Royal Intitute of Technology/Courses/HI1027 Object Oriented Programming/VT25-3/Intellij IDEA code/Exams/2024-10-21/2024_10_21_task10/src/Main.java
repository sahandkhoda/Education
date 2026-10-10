public class Main {

    public static void main(String[] args) {

        char[] helloChars = {'H', 'e', 'l', 'l', 'o', '!'};
        Text helloText1 = new Text(helloChars);
        Text helloText2 = new Text(helloChars);

        Text byeText = new Text("Bye!");

        // toString()
        System.out.println(helloText1.toString());
        System.out.println(helloText1.toString());
        System.out.println(byeText.toString());
        System.out.println();

        //charAt()
        for (char c : byeText.getChars()) {
            System.out.println(c);
        }
        System.out.println();

        // replace()
        // Note: The method returns a new object, meaning helloText1 is unchanged.
        System.out.println(helloText1.replace('l','b').toString());
        System.out.println();

        // concat()
        System.out.println(helloText1.concat(byeText));
        System.out.println();

        // compareTo()
        System.out.println("Compare : " + helloText1.compareTo(helloText2));
        System.out.println("Compare : " + helloText1.compareTo(byeText));
        System.out.println();

        // equals()
        System.out.println("Equal? " + helloText1.equals(helloText2));
        System.out.println("Equal? " + helloText1.equals(byeText));
        System.out.println();

    }

}