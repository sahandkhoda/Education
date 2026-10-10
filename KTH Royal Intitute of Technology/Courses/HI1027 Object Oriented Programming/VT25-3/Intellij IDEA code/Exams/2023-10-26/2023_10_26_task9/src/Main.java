import java.util.ArrayList;

public class Main {

    public static void main(String[] args) {

        // TASK

        // Constructor call
        Task task1 = new Task("Hello", Priority.MID);
        Task task2 = new Task("Hello", Priority.HIGH);
        Task task3 = new Task("Bye");

        // addText()
        task1.addText("o");

        // setPriority()
        task2.setPriority(Priority.LOW);

        // compareTo()
        System.out.println(task1.compareTo(task2));
        System.out.println(task1.compareTo(task3));

        // equals()
        System.out.println(task1.equals(task2));
        System.out.println(task1.equals(task3));

        System.out.println(task1.toString());



        // TASK LIST

        // Constructor call
        TaskList taskList = new TaskList();

        // createTask()
        taskList.createTask("AAB", Priority.LOW);
        taskList.createTask("AAC", Priority.MID);
        taskList.createTask("AFA", Priority.HIGH);
        taskList.createTask("AA");

        // findTasks()
        System.out.println(taskList.findTasks("AA").toString());

        // removeTask()
        taskList.removeTask(new Task("AA", Priority.MID));
        System.out.println(taskList.findTasks("AA").toString());

    }

}