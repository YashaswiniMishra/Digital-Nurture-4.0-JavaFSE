public class mmain{
    public static void main(String args[]){
        Product [] p= {
            new Product(1, "Watch", "Accessories"),
            new Product(2, "Jeans", "Garments"),
            new Product(3, "Mobile", "Electronics"),
            new Product(4, "Samosa", "Food")
        };

        Product a = LinearSearch.search(p, "Watch");
        Product b = BinarySearch.search(p, "Jeans");

        System.out.println("Linear Search:");
        if (a != null)
            System.out.println(a.productName);
        else
            System.out.println("Not Found");

        System.out.println("Binary Search:");
        if (b != null)
            System.out.println(b.productName);
        else
            System.out.println("Not Found");
    }
}