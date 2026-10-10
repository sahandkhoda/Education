import java.time.LocalDateTime;

public class Todo {

    private final String title;
    private String description;
    private LocalDateTime lastUpdated;
    private boolean completed;

    public Todo(String title, String description) {
        lastUpdated = LocalDateTime.now();
        this.title = title;
        this.description = lastUpdated + "\n" + description + "\n";
        completed = false;
    }

    // ACCESS METHODS
    public String getTitle() {
        return title;
    }

    public String getDescription() {
        return description;
    }

    public LocalDateTime getLastUpdated() {
        return lastUpdated;
    }

    public boolean isCompleted() {
        return completed;
    }

    // MUTATOR METHODS
    public void addDescription(String str) {
        updateLatestDateTime();
        description += "\n" +
                lastUpdated + "\n" +
                str + "\n";
    }

    public void updateLatestDateTime() {
        this.lastUpdated = LocalDateTime.now();
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }

    @Override
    public String toString() {
        return
                "TITLE: " + title + "\n" +
                        "Completed? " + completed + "\n\n" +
                        "=== Journal ===\n\n" +
                        description;
    }
}
