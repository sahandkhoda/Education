import java.util.ArrayList;
import java.util.Collections;

public class TaskList {

    // PRIVATE DATA MEMBERS

    private final ArrayList<Task> tasks;


    // CONSTRUCTORS

    public TaskList(ArrayList<Task> initialTasks) {
        if (initialTasks == null) {
            throw new IllegalArgumentException("initialTasks is null.");
        }
        tasks = new ArrayList<>();
        tasks.addAll(initialTasks);
        sort();
    }

    public TaskList() {
        tasks = new ArrayList<>();
    }


    // PUBLIC MUTATOR METHODS

    public void createTask(String text, Priority priority) {
        tasks.add(new Task(text, priority));
        sort();
    }

    public void createTask(String text) {
        createTask(text, Priority.MID);
    }

    public ArrayList<Task> findTasks(String str) {
        ArrayList<Task> temp = new ArrayList<>();
        for (Task task : tasks) {
            if (task.getText().contains(str)) {
                temp.add(task);
            }
        }
        return temp;
    }

    public boolean removeTask(Task task) {
        return tasks.remove(task);
    }


    // PUBLIC ACCESS METHODS

    public ArrayList<Task> getTasks() {
        return new ArrayList<>(tasks);
    }


    // DISPLAY

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Task task : tasks) {
            sb.append(task.toString()).append("\n");
        }
        return sb.toString();
    }


    // PRIVATE HELP METHODS

    private void sort() {
        Collections.sort(tasks);
    }

}