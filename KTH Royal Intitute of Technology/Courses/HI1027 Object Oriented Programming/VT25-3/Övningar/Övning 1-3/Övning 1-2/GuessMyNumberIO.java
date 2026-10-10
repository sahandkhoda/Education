import java.util.Scanner;

public class GuessMyNumberIO {

	public static void main(String[] args) {
		
		GuessMyNumberModel guessModel = new GuessMyNumberModel(100);		
		Scanner scan = new Scanner(System.in);
		
		String cont = "y";
		while(cont.toLowerCase().charAt(0) == 'y') {
			
			guessModel.initGame();
			int guess;
			do {
				System.out.print("Make a guess [1.." + guessModel.getMAX() + "]: ");
				String numStr = scan.nextLine().trim();
				guess = Integer.parseInt(numStr);
				guessModel.setGuess(guess);
				System.out.println("Your guess is " + guessModel.compareGuessToStr());
				System.out.println("Number of guesses: " + guessModel.getNoOfGuesses());
			}
			while(guess != guessModel.getSecret());
			
			System.out.println("Congratulations!");
			
			System.out.print("Continue (y/n)? " );
			cont = scan.nextLine();
		}
		
		System.out.println("Bye bye.");
		scan.close();
	}
}
