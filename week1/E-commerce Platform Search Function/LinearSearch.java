public class LinearSearch{
    public static Product search(Product [] prd, String n){
        for(Product p: prd){
            if (p.productName.equalsIgnoreCase(n))

                return p;
        }
            return null;
    }
}