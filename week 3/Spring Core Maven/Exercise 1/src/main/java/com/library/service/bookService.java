package com.library.service;
import com.library.repository.BookRepository;
public class bookService {
    private BookRepository a;

    
    public void set(BookRepository a) {
        this.a = a;
    }

    public void add(String n) {
        a.get(n);
    }
}
