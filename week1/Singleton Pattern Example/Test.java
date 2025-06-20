public class Test {
    public static void main(String[] args) {
        Logger a= Logger.getInstance();
        a.log("Log #1");
        Logger b= Logger.getInstance();
        b.log("Log #2");
        //for verification
        if(a==b)
        System.out.println("Both A and B are same instance");
        else
        System.out.println("A and B are different instances");  
    }
}
