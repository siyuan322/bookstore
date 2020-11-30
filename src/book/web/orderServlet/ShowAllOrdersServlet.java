package book.web.orderServlet;

import book.domain.Order;
import book.domain.User;
import book.service.OrderService;
import book.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class ShowAllOrdersServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OrderService orderService = new OrderServiceImpl();
        // 当前登录用户
        User loginUser = (User) req.getSession().getAttribute("loginUser");
        List<Order> orderList = new ArrayList<Order>();
        // 当前登录的是管理员
        if ("admin".equals(loginUser.getRole())) {
            orderList = orderService.searchOrders(0);
            req.setAttribute("orderList", orderList);
            req.getRequestDispatcher("/pages/manager/order_manager.jsp").forward(req, resp);
        } else {
            orderList = orderService.searchOrders(loginUser.getId());
            req.setAttribute("orderList", orderList);
            req.getRequestDispatcher("/pages/order/order.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
