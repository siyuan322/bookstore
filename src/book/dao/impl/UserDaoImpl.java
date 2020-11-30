package book.dao.impl;

import book.dao.UserDao;
import book.domain.User;
import book.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class UserDaoImpl extends BaseDao implements UserDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public User queryUserByUsername(String username) {
        String sql = "select * from t_user where username = ?";
        List<User> userlist = null;
        userlist = template.query(sql, new BeanPropertyRowMapper(User.class), username);
        if (userlist == null || userlist.size() == 0) {
            return null;
        } else {
            return userlist.get(0);
        }
    }

    @Override
    public User queryUserByUsernameAndPassword(String username, String password) {
        String sql = "select * from t_user where username = ? and password = ?";
        List<User> userlist = null;
        userlist = template.query(sql, new BeanPropertyRowMapper(User.class), username, password);
        if (userlist == null || userlist.size() == 0) {
            return null;
        } else {
            return userlist.get(0);
        }
    }

    @Override
    public int saveUser(User user) {
        String sql = "insert into t_user(username, password, email, role) values(?, ?, ?, ?)";
        return update(sql, user.getUsername(), user.getPassword(), user.getEmail(), user.getRole());
    }
}
