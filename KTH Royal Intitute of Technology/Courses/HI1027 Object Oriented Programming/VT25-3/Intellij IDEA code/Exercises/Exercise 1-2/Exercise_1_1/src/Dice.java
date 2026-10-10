public class Dice {

    private int value;

    public Dice() {
        value = 1;      // Initialize
    }

    public void throwDice() {
        value = (int)(Math.random()*6)+1;
    }

    public int getValue() {
        return value;
    }

    @Override
    public String toString() {
        return "Dice{" +
                "value=" + value +
                '}';
    }
}
