public class Main {

    public static void main(String[] args) {

        Flight flightA = new Flight("Barcelona", "123ABC", new Time(14,30,40));
        Flight flightB = new Flight("Stockholm", "456DEF", flightA.getDepartureTime());

        Time departureTimeB = flightB.getDepartureTime();       // Returns a copy
        departureTimeB.tic(1840);                            // FlightB is not changed.

        System.out.println(flightA.toString());
        System.out.println(flightB.toString());
        System.out.println("DepartureTimeB = " + departureTimeB.toString());

    }

}