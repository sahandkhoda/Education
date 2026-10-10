public class Main {

    public static void main(String[] args) {

        User adam = new User("Adam Sandler", "adamsandler@grownups.com", "kevinjamesismybestfriend");
        User chris = new User("Chris Rock", "slapped@rock.com", "immaslaphiskid");
        User kevin = new User("Kevin James", "big@guy.com", "ilikeburgers");

        Auction auction = new Auction(adam, "Golf Clubs");
        auction.addBid(new Bid(chris, 100));
        auction.addBid(new Bid(kevin, 200));
        auction.addBid(new Bid(chris, 300));
        System.out.println(auction.toString());

    }

}