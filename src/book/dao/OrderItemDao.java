package book.dao;

import book.domain.OrderItem;

import java.util.List;

public interface OrderItemDao {
    /**
     * 保存订单项
     *
     * @param orderItem
     * @return
     */
    public int saveOrderItem(OrderItem orderItem);

    /**
     * 查看订单详情
     *
     * @param order_id
     * @return
     */
    public List<OrderItem> searchOrderItem(String order_id);

}
