public enum Currency {

    EUR("euro",     1.00),
    SEK("kronor",   0.095),
    USD("dollar",   0.91),
    NOK("kronor",   0.092);

    private final String name;
    private final double rate;      // rate vs EUR

    private Currency(String name, double rate) {
        this.name = name;
        this.rate = rate;
    }

    public String getName() {
        return name;
    }

    public double getRate() {
        return rate;
    }
}
