//package SingletonPatternExample;

public class Logger{
    private static Logger instance;

    //to prevent multiple instance
    private Logger(){
        System.out.println("Logger initialised");
    }

    //to create only single instance
    public static Logger getInstance(){
        if(instance==null) 
            instance= new Logger();
        return instance;
    }

    public void log(String a){
        System.out.println("LOG: "+a);
    }

}