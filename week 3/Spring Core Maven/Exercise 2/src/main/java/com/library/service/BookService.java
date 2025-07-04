package com.library.service;

import com.library.repository.BookRepository;

public class BookService {
    private BookRepository bookRepository;


    public void set(BookRepository bookRepository) {
        this.bookRepository = bookRepository;
    }

    public void add(String bookName) {
        bookRepository.get(bookName);
    }
}
