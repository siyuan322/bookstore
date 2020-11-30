package book.web.orderServlet;

import book.domain.Cart;
import book.domain.User;
import book.service.OrderService;
import book.service.impl.OrderServiceImpl;
import book.utils.MailUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CreateOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取Cart
        Cart cart = (Cart) req.getSession().getAttribute("cart");
        // 获取用户id
        User loginUser = (User) req.getSession().getAttribute("loginUser");

        if (loginUser == null) {
            resp.sendRedirect(req.getContextPath() + "/pages/user/login.jsp");
            return;
        }

        Integer userId = loginUser.getId();

        // 生成订单
        OrderService service = new OrderServiceImpl();
        String orderId = service.createOrder(cart, userId);

        // 发送邮件
        MailUtils.sendMail(loginUser.getEmail(), "请确认订单", "订单确认");
        System.out.println("发送成功。。");

        req.getSession().setAttribute("orderId", orderId);
        resp.sendRedirect(req.getContextPath() + "/pages/cart/checkout.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
