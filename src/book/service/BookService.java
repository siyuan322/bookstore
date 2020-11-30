package book.service;

import book.domain.Book;

import java.util.List;

public interface BookService {
    /**
     * 添加图书
     *
     * @param book
     */
    public void addBook(Book book);

    /**
     * 查找所有图书
     *
     * @return
     */
    public List<Book> showAllBooks(int start, int showNum);

    /**
     * 图书总条数
     *
     * @return
     */
    public int bookNum(String search);

    /**
     * 根据id号查找
     *
     * @param id
     * @return
     */
    Book searchById(int id);

    /**
     * 修改图书信息
     *
     * @param editBook
     */
    void editOneBook(Book editBook);

    /**
     * 根据id号删除图书
     *
     * @param id
     */
    void deleteBook(int id);

    /**
     * 模糊查找
     *
     * @param start
     * @param showNum
     * @return
     */
    List<Book> showSomeBooks(String search, int start, int showNum);
}
