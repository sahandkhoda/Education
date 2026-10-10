public class Flight {

    // PRIVATE DATA MEMBERS

    private final String destination, flightNr;
    private final Time departureTime;


    // CONSTRUCTOR

    public Flight(String destination, String flightNr, Time departureTime) {
        this.destination = destination;
        this.flightNr = flightNr;
        this.departureTime = new Time(departureTime.getH(), departureTime.getM(), departureTime.getS());
    }


    // ACCESS METHODS

    public String getDestination() {
        return destination;
    }

    public String getFlightNr() {
        return flightNr;
    }

    public Time getDepartureTime() {
        return new Time(departureTime.getH(), departureTime.getM(), departureTime.getS());
    }


    // DISPLAY

    @Override
    public String toString() {
        return String.format(
                "Flight [%s], %s, %02d:%02d:%02d",
                flightNr, destination, departureTime.getH(), departureTime.getM(), departureTime.getS());
    }

}
