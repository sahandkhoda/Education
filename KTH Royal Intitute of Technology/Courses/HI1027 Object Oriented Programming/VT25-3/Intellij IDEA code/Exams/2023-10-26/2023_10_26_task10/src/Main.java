public class Main {
    public static void main(String[] args) {

        StringBuilder sb1 = new StringBuilder("Hell");
        sb1.append('o');
        System.out.println(sb1.toString());
        System.out.println("Length   : " + sb1.length());
        System.out.println("Capacity : " + sb1.capacity());

        System.out.println();

        StringBuilder sb2 = new StringBuilder();
        sb2.append("ByeMyDearOldFriend");           // 18 characters
        sb2.append('!');
        System.out.println(sb2.toString());
        System.out.println("Length   : " + sb2.length());
        System.out.println("Capacity : " + sb2.capacity());
    }
}