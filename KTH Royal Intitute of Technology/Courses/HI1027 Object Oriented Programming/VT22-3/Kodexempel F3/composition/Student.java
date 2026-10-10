package composition;


public class Student {

    private final String firstName, lastName;
    private final Address theAddress;

    public Student(String first, String last,
            String street, String city) {
        firstName = first;
        lastName = last;
        theAddress = new Address(street, city);
    }

    public Address getAddress() {
        // Return a copy (i.e. a clone)
        return new Address(theAddress.getStreet(), theAddress.getCity());
    }

    public String toString() {
        String result;
        result = "Student: " + firstName + " " + lastName;
        result += ", Address: " + theAddress.toString();
        return result;
    }
}
