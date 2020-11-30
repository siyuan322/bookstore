package book.dao.impl;

import book.dao.OrderItemDao;
import book.domain.OrderItem;
import book.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class OrderItemDaoImpl implements OrderItemDao {
    JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public int saveOrderItem(OrderItem orderItem) {
        String sql = "insert into t_order_item(name, count, price, total_price, order_id) values(?,?,?,?,?)";
        return template.update(sql, orderItem.getName(), orderItem.getCount(), orderItem.getPrice(), orderItem.getTotalPrice(), orderItem.getOrderId());
    }

    @Override
    public List<OrderItem> searchOrderItem(String order_id) {
        String sql = "select * from t_order_item where order_id=?";
        return template.query(sql, new BeanPropertyRowMapper<OrderItem>(OrderItem.class), order_id);
    }
}
