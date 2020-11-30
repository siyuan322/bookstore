package book.service.impl;

import book.dao.BookDao;
import book.dao.impl.BookDaoImpl;
import book.domain.Book;
import book.service.BookService;

import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDao bookDao = new BookDaoImpl();

    @Override
    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    @Override
    public List<Book> showAllBooks(int start, int showNum) {
        return bookDao.showAllBooks(start, showNum);
    }

    @Override
    public int bookNum(String search) {
        return bookDao.booksNum(search);
    }

    @Override
    public Book searchById(int id) {
        return bookDao.searchById(id);
    }

    @Override
    public void editOneBook(Book editBook) {
        bookDao.editOneBook(editBook);
    }

    @Override
    public void deleteBook(int id) {
        bookDao.deleteBook(id);
    }

    @Override
    public List<Book> showSomeBooks(String search, int start, int showNum) {
        return bookDao.showSomeBook(search, start, showNum);
    }
}
