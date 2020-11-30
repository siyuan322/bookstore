package book.dao.impl;

import book.dao.BookDao;
import book.domain.Book;
import book.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class BookDaoImpl extends BaseDao implements BookDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public int addBook(Book book) {
        String sql = "insert into t_book(name, price, author, sales, stock, img_path, brief) values(?, ?, ?, ?, ?, ?, ?)";
        return update(sql, book.getName(), book.getPrice(), book.getAuthor(), book.getSales(), book.getStock(), book.getImg_path(), book.getBrief());
    }

    @Override
    public List<Book> showAllBooks(int start, int showNum) {
        String sql = "select * from t_book limit ?, ?";
        return queryForList(Book.class, sql, start, showNum);
    }

    @Override
    public int booksNum(String search) {
        if ("".equals(search) || search == null) {
            String sql = "select count(*) from t_book";
            return template.queryForObject(sql, Integer.class);
        } else {
            search = "%" + search + "%";
            String sql = "select count(*) from t_book where name like ? or author like ?";
            return template.queryForObject(sql, Integer.class, search, search);
        }
    }

    @Override
    public Book searchById(int id) {

        String sql = "select * from t_book where id = ?";
        List<Book> booklist = null;
        booklist = template.query(sql, new BeanPropertyRowMapper(Book.class), id);
        if (booklist == null || booklist.size() == 0) {
            return null;
        } else {
            return booklist.get(0);
        }
    }

    @Override
    public void editOneBook(Book editBook) {
        String sql = "update t_book set name=?, price=?, author=?, stock=?, brief=? where id = ?";
        System.out.println(editBook);
        template.update(sql, editBook.getName(), editBook.getPrice(), editBook.getAuthor(),
                editBook.getStock(), editBook.getBrief(), editBook.getId());
        System.out.println("修改完毕");

    }

    @Override
    public void deleteBook(int id) {
        String sql = "delete from t_book where id = ?";
        template.update(sql, id);
    }

    @Override
    public List<Book> showSomeBook(String search, int start, int showNum) {
        String sql = "";
        if (!"".equals(search) && search != null) {
            search = "%" + search + "%";
            sql = "select * from t_book where name like ? or author like ? limit ?,?";
            return template.query(sql, new BeanPropertyRowMapper<Book>(Book.class), search, search, start, showNum);

        } else {
            sql = "select * from t_book limit ?,?";
            return template.query(sql, new BeanPropertyRowMapper<Book>(Book.class), start, showNum);
        }
    }
}
