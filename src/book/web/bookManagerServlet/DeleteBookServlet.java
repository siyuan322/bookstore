package book.web.bookManagerServlet;

import book.service.BookService;
import book.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取id号
        String idStr = req.getParameter("id");
        int id = Integer.parseInt(idStr);

        // 删除id
        BookService service = new BookServiceImpl();

        service.deleteBook(id);

        // 跳转页面
        resp.sendRedirect(req.getContextPath() + "/book/showAllBooksServlet");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
