public class Money implements IMoney {

    // PRIVATE DATA MEMBERS

    private final double amount;
    private final Currency currency;


    // CONSTRUCTOR

    public Money(double amount, Currency currency) throws IllegalArgumentException {
        if (amount < 0 ) {
            throw new IllegalArgumentException("Invalid amount!\n");
        }
        this.amount = amount;
        this.currency = currency;
    }

    public Money(double amount) {
        this(amount, Currency.EUR);
    }

    public Money() {
        this(0,Currency.EUR);
    }


    // PUBLIC ACCESS METHODS

    @Override
    public double getAmount() {
        return amount;
    }

    @Override
    public Currency getCurrency() {
        return currency;
    }


    // PUBLIC MUTATOR METHODS

    @Override
    public Money copy() {
        return new Money(amount, currency);
    }

    @Override
    public Money toCurrency(Currency newCurrency) {
        return new Money(calculateAmountIn(newCurrency), newCurrency);
    }

    @Override
    public Money add(Money moneyToAdd) {
        double sum = amount + moneyToAdd.calculateAmountIn(currency);
        return new Money(sum, currency);
    }

    @Override
    public Money subtract(Money moneyToAdd) {
        double difference = amount - moneyToAdd.calculateAmountIn(currency);
        if (difference < 0) {
            throw new IllegalArgumentException("New amount is less than 0.\n");
        }
        return new Money(difference, currency);
    }

    @Override
    public int compareTo(Money other) {

        // COMPARE: amount
        double thisEUR = this.calculateAmountIn(Currency.EUR);
        double otherEUR = other.calculateAmountIn(Currency.EUR);
        double deltaAmount = thisEUR - otherEUR;

        // this lesser than or "equal" to other
        if (deltaAmount <= -1e-3) {
            return -1;
        }

        // this greater than or "equal" to other
        else if (1e-3 <= deltaAmount) {
            return 1;
        }

        // Else...
        else {
            return 0;
        }

    }

    @Override
    public boolean equals(Object o) {

        // Check if same object
        if (this == o) {
            return true;
        }

        // Check if same class instance
        if (o instanceof Money) {
            Money other = (Money) o;
            return this.compareTo(other) == 0;
        }

        // Else...
        return false;
    }


    // DISPLAY

    @Override
    public String toString() {
        return amount + " " + currency.getName();
    }


    // PRIVATE HELP METHOD

    private double calculateAmountIn(Currency newCurrency) {
        // 1. Convert to EUR
        // 2. Convert to newCurrency
        return amount * currency.getRate() / newCurrency.getRate();
    }

}