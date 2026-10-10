package composition;


public class StudentMain {

    public static void main(String[] args) {

        // Create some Address and Student objects and prints them.
        Student john = new Student("John", "Smith",
                "21 Jump Street", "Lynchburg");

        Student marsha = new Student("Marsha", "Jones",
                "123 Main Street", "Euclid");

        System.out.println(john);
        System.out.println(marsha);

        Address a = john.getAddress(); // Returns a clone, i.e. a copy
        System.out.println("Johns address: " + a.toString());
    }
}
