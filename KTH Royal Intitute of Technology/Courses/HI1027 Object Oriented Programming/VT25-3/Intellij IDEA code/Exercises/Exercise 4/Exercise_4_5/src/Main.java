import java.util.Arrays;

public class Main {

    public static void main(String[] args) {

        Money m1 = new Money(1000, Currency.SEK);
        Money m2 = new Money(530);
        Money m3 = new Money(14, Currency.NOK);
        Money m4 = new Money(13, Currency.USD);
        Money m5 = new Money();

        System.out.println(m1.compareTo(m3) + "\n");

        Money[] money = new Money[5];
        money[0] = m1;
        money[1] = m2;
        money[2] = m3;
        money[3] = m4;
        money[4] = m5;

        Arrays.sort(money);
        for (Money m : money) {
            System.out.println(m.toString());
        }


    }

}