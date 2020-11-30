package book.dao;

import book.domain.Book;

import java.util.List;

public interface BookDao {
    /**
     * 添加课本
     *
     * @param book
     */
    public int addBook(Book book);

    /**
     * 查找所有图书
     *
     * @return
     */
    public List<Book> showAllBooks(int start, int showNum);

    /**
     * 查找图书总数量
     *
     * @return
     */
    public int booksNum(String search);

    /**
     * 根据id查找
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
     * 根据id删除图书
     *
     * @param id
     */
    void deleteBook(int id);

    /**
     * 模糊查找
     *
     * @param search
     * @param start
     * @param showNum
     */
    List<Book> showSomeBook(String search, int start, int showNum);
}
