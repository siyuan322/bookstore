package book.web.orderServlet;

import book.domain.OrderItem;
import book.domain.User;
import book.service.OrderService;
import book.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ShowOrderItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String orderId = req.getParameter("orderId");

        User loginUser = (User) req.getSession().getAttribute("loginUser");

        OrderService orderService = new OrderServiceImpl();
        List<OrderItem> orderItems = orderService.searchOrderItems(orderId);

        req.setAttribute("orderItems", orderItems);

        if ("admin".equals(loginUser.getRole())) {
            req.getRequestDispatcher("/pages/manager/orderItem_manager.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/pages/order/orderItem.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
