import java.time.LocalDate;

public class Task implements Comparable<Task> {

    // PRIVATE DATA MEMBERS

    private String text;
    private Priority priority;
    private LocalDate lastUpdated;


    // CONSTRUCTORS

    public Task(String text, Priority priority) {
        this.text = text;
        this.priority = priority;
        updateDate();
    }

    public Task(String text) {
        this(text, Priority.MID);
    }


    // PUBLIC MUTATOR METHODS

    public void addText(String str) {
        // Only update if string is not null.
        if (str != null) {
            text += "\n" + str;
            updateDate();
        }
    }

    public void setPriority(Priority newPriority) {
        // Only update if priority is changed.
        if (priority != newPriority) {
            priority = newPriority;
            updateDate();
        }
    }

    @Override
    public int compareTo(Task other) {

        // COMPARE PRIORITY

        // Difference between priority ranks.
        int diff = this.getPriority().compareTo(other.getPriority());

        // Negative value implies "this" has lower priority than "other". Negative sign reverses the order!
        if (diff != 0) {
            return (-1)*diff;
        }

        // COMPARE TEXT

        else {
            return this.getText().compareTo(other.getText());
        }

    }

    @Override
    public boolean equals(Object o) {

        // Check if same object.
        if (this == o) {
            return true;
        }

        // Check if same class instance.
        if (o instanceof Task) {
            Task other = (Task) o;
            return this.compareTo(other) == 0;
        }

        return false;
    }

    // PUBLIC ACCESS METHODS

    public String getText() {
        return text;
    }

    public Priority getPriority() {
        return priority;
    }

    public LocalDate getLastUpdated() {
        return lastUpdated;
    }


    // DISPLAY

    @Override
    public String toString() {
        return  "==========" + "\n" +
                "Last updated : (" + lastUpdated + ")" + "\n" +
                "Priority = " + priority + "\n" +
                "==========" + "\n" +
                text + "\n";
    }


    // PRIVATE HELP METHODS

    private void updateDate() {
        this.lastUpdated = LocalDate.now();
    }

}