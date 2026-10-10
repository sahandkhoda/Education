import java.util.Random;

public class GuessMyNumberModel {

    // PRIVATE DATA MEMBERS

    private final int LIMIT;
    private int secret, latestGuess, nrOfGuesses;
    private Random random;

    public GuessMyNumberModel(int LIMIT) {
        this.LIMIT = LIMIT;
    }


    // PUBLIC MUTATOR METHODS

    public void initGame() {
        latestGuess = 0;
        nrOfGuesses = 0;
        random = new Random();
        secret = random.nextInt(LIMIT) + 1;
        System.out.println(secret);
    }

    public void setGuess(int guess) {
        latestGuess = guess;
        nrOfGuesses++;
    }

    public String compareGuessToStr() {
        int compared = compareGuess();
        if (compared > 0) {
            return "Too HIGH\n";
        } else if (compared < 0) {
            return "Too LOW\n";
        } else {
            return "CORRECT\n";
        }
    }

    // ACCESS METHODS

    public int getLIMIT() {
        return LIMIT;
    }

    public int getSecret() {
        return secret;
    }

    public int getLatestGuess() {
        return latestGuess;
    }

    public int getNrOfGuesses() {
        return nrOfGuesses;
    }


    // PRIVATE HELP METHOD

    private int compareGuess() {
        int difference = secret - latestGuess;
        if (difference < 0) {
            return 1;
        } else if (difference > 0) {
            return -1;
        } else {
            return 0;
        }
    }

}
