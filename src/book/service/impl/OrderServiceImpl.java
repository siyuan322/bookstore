package book.service.impl;

import book.dao.BookDao;
import book.dao.OrderDao;
import book.dao.OrderItemDao;
import book.dao.impl.BookDaoImpl;
import book.dao.impl.OrderDaoImpl;
import book.dao.impl.OrderItemDaoImpl;
import book.domain.*;
import book.service.OrderService;

import java.util.Date;
import java.util.List;
import java.util.Map;

public class OrderServiceImpl implements OrderService {

    private OrderDao orderDao = new OrderDaoImpl();
    private OrderItemDao orderItemDao = new OrderItemDaoImpl();
    private BookDao bookDao = new BookDaoImpl();

    @Override
    public String createOrder(Cart cart, Integer userId) {
        // 订单号
        String orderId = System.currentTimeMillis() + "" + userId;

        Order order = new Order(orderId, new Date(), cart.getTotalPrice(), 0, userId);
        // 保存订单
        orderDao.saveOrder(order);

        // 遍历购物车中每一个商品项
        for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
            CartItem cartItem = entry.getValue();

            OrderItem orderItem = new OrderItem(cartItem.getId(), cartItem.getName(), cartItem.getCount(), cartItem.getPrice(), cartItem.getTotalPrice(), orderId);
            orderItemDao.saveOrderItem(orderItem);

            Book book = bookDao.searchById(cartItem.getId());
            book.setSales(book.getSales() + cartItem.getCount());
            book.setStock(book.getStock() - cartItem.getCount());
            bookDao.editOneBook(book);
        }

        cart.clear();
        return orderId;
    }

    @Override
    public List<Order> searchOrders(int userId) {
        return orderDao.searchOrders(userId);
    }

    @Override
    public List<OrderItem> searchOrderItems(String orderId) {
        return orderItemDao.searchOrderItem(orderId);
    }

    @Override
    public void changeOrderStatus(String orderId) {
        orderDao.changeOrderStatus(orderId);
    }
}
