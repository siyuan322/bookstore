package book.web.orderServlet;

import book.service.OrderService;
import book.service.impl.OrderServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ChangeStatusServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 获取id
        String orderId = req.getParameter("orderId");

        OrderService orderService = new OrderServiceImpl();

        orderService.changeOrderStatus(orderId);

        resp.sendRedirect(req.getContextPath() + "/order/showAllOrdersServlet");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
