package book.dao;

import book.domain.Order;

import java.util.List;

public interface OrderDao {
    /**
     * 保存订单
     *
     * @param order
     * @return
     */
    public int saveOrder(Order order);

    /**
     * 根据用户id查找订单
     *
     * @param userId
     * @return
     */
    List<Order> searchOrders(int userId);

    /**
     * 改变状态
     *
     * @param orderId
     */
    void changeOrderStatus(String orderId);
}
