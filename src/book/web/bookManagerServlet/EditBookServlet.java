package book.web.bookManagerServlet;

import book.domain.Book;
import book.service.BookService;
import book.service.impl.BookServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

public class EditBookServlet extends HttpServlet {
    BookService service = new BookServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        // 获取参数
        Map<String, String[]> map = req.getParameterMap();
        Book editBook = new Book();
        try {
            BeanUtils.populate(editBook, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        service.editOneBook(editBook);
        // 跳转页面
        resp.sendRedirect(req.getContextPath() + "/book/showAllBooksServlet");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取id号
        String idStr = req.getParameter("id");
        int id = Integer.parseInt(idStr);

        Book editBook = service.searchById(id);

        // 存储信息
        req.setAttribute("editBook", editBook);
        req.getRequestDispatcher("/pages/manager/book_edit.jsp").forward(req, resp);
    }
}
