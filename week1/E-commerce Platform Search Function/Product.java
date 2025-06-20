public class Product{
    int productId;
    public String productName, category;
    public Product(int pid, String pn, String c){
        productId=pid;
        productName=pn;
        category=c;
    }
    public String getProductName() {
    return productName;
    }
}