class Book {
    String title;
    String author;
    int price;

    Book(String title, String author, int price) {
        this.title = title;
        this.author = author;
        this.price = price;
    }

    void printInfo() {
        System.out.println( "title: " + title + " author: " + author + " price: " + price );
    }
}

public class Main {
    public static void main(String[] args) {
        Book b1 = new Book( "The Snowwhite", "Grim", 10000);
        Book b2 = new Book( "The Jungle", "skrr", 20000);
        b1.printInfo(); 
        b2.printInfo();
        
    }
}