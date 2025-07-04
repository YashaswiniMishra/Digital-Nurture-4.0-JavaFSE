package com.library;

public class MainApp {
    public static void main(String [] args){
        ApplicationContext ob= new ClassPathmlApplicationContext("applicationContext.xml");
        BookService obj=(BookService) ob.getBean("bookService");
        obj.add("Gitanjali");
    }
    
}
