public class User {

    // PRIVATE DATA MEMBERS

    private final String username, email;
    private String password;


    // CONSTRUCTOR

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        this.password = password;
    }


    // MUTATOR METHODS

    public void setPassword(String password) {
        this.password = password;
    }


    // ACCESS METHODS

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }


    // DISPLAY

    public String toString() {
        return  "USERNAME : " + username + "\n" +
                "EMAIL    : " + email + "\n" +
                "PASSWORD : " + password + "\n";
    }

}
