/**
 * Represents an amount of money, represented in a specific currency.
 * Instances of this class are <em>immutable</em>.
 * <p>
 * The implementing class must have three constructors, with two arguments,
 * (throws IllegalArgumentException if amount < 0), one argument (amount 0),
 * and no arguments (amount 0, currency EUR).
 */

public interface IMoney extends Comparable<Money> {

    /** Return the amount for this Money. */
    public abstract double getAmount();

    /** Return the currency for this Money. */
    public abstract Currency getCurrency();

    /** Return a copy of this instance. */
    public abstract Money copy();

    /**
     * Create a new Money instance, with the indicated currency and the
     *
     * @param newCurrency
     * @return a new Money instance.
     *
     */
    public abstract Money toCurrency(Currency newCurrency);

    /**
     * Create a new Money instance with the sum, in the same currency as this.
     *
     * @param moneyToAdd the money to add to this money.
     * @return a new Money instance in the same currency as this.
     */
    public abstract Money add(Money moneyToAdd);

    /**
     * Create a new Money instance with the difference, in the same currency as this.
     *
     * @param moneyToAdd the money to add to this money.
     * @return a new Money instance in the same currency as this.
     * @throws IllegalArgumentException if the sum is less than zero.
     */
    public abstract Money subtract(Money moneyToAdd);

    /** Return a string with the amount, rounded to two decimals, and the currency. */
    @Override
    public abstract String toString();

    /**
     * Compare amounts, internally converted to EUR. Two instances are
     * considered equal if amounts differ less than 1E-3.
     * Also, see documentation for class java.lang.Comparable.
     */
    @Override
    public abstract int compareTo(Money other);

    /**
     * Compare amounts, internally converted to EUR. Two instances are
     * considered equal if amounts differ less than 1E-3.
     * Also, see documentation for class java.lang.Object.
     */
    @Override
    public abstract boolean equals(Object o);

}
