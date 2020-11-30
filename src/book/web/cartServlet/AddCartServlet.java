package book.web.cartServlet;

import book.domain.Book;
import book.domain.Cart;
import book.domain.CartItem;
import book.service.BookService;
import book.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        int id = Integer.parseInt(idStr);
        // 获取图书的信息
        BookService service = new BookServiceImpl();
        Book book = service.searchById(id);
        // 把图书信息转换成cartItem项
        CartItem cartItem = new CartItem(book.getId(), book.getImg_path(), book.getName(), 1, book.getPrice(), book.getPrice());
        // 添加cart.addItem项
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            req.getSession().setAttribute("cart", cart);
        }

        cart.addItem(cartItem);

        req.getSession().setAttribute("lastName", cartItem.getName());

        resp.sendRedirect(req.getHeader("Referer"));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
