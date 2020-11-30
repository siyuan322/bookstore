package book.dao.impl;

import book.dao.OrderDao;
import book.domain.Order;
import book.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao {
    JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public int saveOrder(Order order) {
        String sql = "insert into t_order(order_id, create_time, price, status, user_id) values(?,?,?,?,?)";
        return template.update(sql, order.getOrderId(), order.getCreateTime(), order.getPrice(), order.getStatus(), order.getUserId());
    }

    @Override
    public List<Order> searchOrders(int userId) {
        String sql = "";
        List<Order> orders = new ArrayList<>();
        // 管理员
        if (userId == 0) {
            sql = "select * from t_order";
        } else {
            sql = "select * from t_order where user_id=" + userId;
        }
        orders = template.query(sql, new BeanPropertyRowMapper<Order>(Order.class));
        return orders;
    }

    @Override
    public void changeOrderStatus(String orderId) {
        String sql = "update t_order set status=1 where order_id=?";
        template.update(sql, orderId);
    }
}
