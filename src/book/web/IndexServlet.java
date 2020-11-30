package book.web;

import book.domain.Book;
import book.domain.PageBean;
import book.service.BookService;
import book.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class IndexServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");

        String search = req.getParameter("search");
        System.out.println(search);
        req.getSession().setAttribute("search", search);

        BookService service = new BookServiceImpl();

        PageBean<Book> pageBean = new PageBean();

        // 总记录数
        int totalCount = service.bookNum(search);
        pageBean.setTotalCount(totalCount);

        // 每页显示的条数
        int showNum = 5;
        pageBean.setShowNum(showNum);

        // 总页数
        int totalPage = totalCount % showNum == 0 ? totalCount / showNum : (totalCount / showNum + 1);
        pageBean.setTotalPage(totalPage);

        // 当前页码
        String currentNumStr = req.getParameter("currentPage");
        int currentNum = 1;
        if (currentNumStr != null && !"".equals(currentNumStr)) {
            currentNum = Integer.parseInt(currentNumStr);
        }
        pageBean.setCurrentPage(currentNum);

        // 获取数据集
        int start = (currentNum - 1) * showNum;
        List<Book> books = service.showSomeBooks(search, start, showNum);
        pageBean.setList(books);


        req.setAttribute("bookPb", pageBean);
        req.getRequestDispatcher("/pages/index.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

}
