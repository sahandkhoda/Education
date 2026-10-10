import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        GuessMyNumberModel guessModel = new GuessMyNumberModel(100);

        System.out.println();
        System.out.print("Initialize game? [y/n]: ");
        Scanner scan = new Scanner(System.in);
        String choice = scan.nextLine().toLowerCase();
        while (choice.equals("y")) {

            guessModel.initGame();
            int guess;
            do {
                System.out.print( "Make a guess [1..." + guessModel.getLIMIT() + "]: ");
                String numStr = scan.nextLine().trim();
                guess = Integer.parseInt(numStr);
                guessModel.setGuess(guess);

                System.out.println("Your guess is " +  guessModel.compareGuessToStr());
                System.out.println("Number of guesses: " +  guessModel.getNrOfGuesses());

            } while (guess != guessModel.getSecret());

            System.out.println("Congratulations!");
            System.out.println("Continue [y/n]? ");
            choice = scan.nextLine().toLowerCase();

        }

        System.out.println("Bye!");
        scan.close();

    }

}