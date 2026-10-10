public enum KLevel {

    BEGINNER    (1),
    EASY        (2),
    SKILLED     (3),
    ADVANCED    (4);

    private final int value;

    private KLevel(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}
