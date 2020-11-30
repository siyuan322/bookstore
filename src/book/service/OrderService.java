package book.service;

import book.domain.Cart;
import book.domain.Order;
import book.domain.OrderItem;

import java.util.List;

public interface OrderService {
    public String createOrder(Cart cart, Integer userId);

    /**
     * 根据id查找订单
     *
     * @param userId
     * @return
     */
    public List<Order> searchOrders(int userId);

    /**
     * 查找订单项
     *
     * @param orderId
     * @return
     */
    public List<OrderItem> searchOrderItems(String orderId);

    /**
     * 改变发货状态
     *
     * @param orderId
     */
    void changeOrderStatus(String orderId);
}
