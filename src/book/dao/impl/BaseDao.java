package book.dao.impl;

import book.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;


import java.util.List;

public abstract class BaseDao {

    // 使用DbUtils操作数据库
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    /**
     * update方法用来执行insert/delete语句
     * @param sql
     * @param args
     * @return 如果返回-1则失败
     */
    public int update(String sql, Object ...args) {
        return template.update(sql, args);

    }

    /**
     * 查询返回一个javaBean的sql语句
     * @param type 返回的对象类型
     * @param sql
     * @param args
     * @param <T> 返回的类型的泛型
     * @return
     */
    public <T> T queryForOne(Class<T> type, String sql, Object ...args) {
        T tmp = null;
        tmp = template.queryForObject(sql, args,new BeanPropertyRowMapper<T>(type));
        return tmp;
    }

    /**
     * 查询返回多个javaBean的情况
     * @param type
     * @param sql
     * @param args
     * @param <T>
     * @return
     */
    public <T>List<T> queryForList(Class<T> type, String sql, Object ...args) {
        return template.query(sql, new BeanPropertyRowMapper<T>(type), args);
    }

}
