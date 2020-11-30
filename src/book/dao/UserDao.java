package book.dao;

import book.domain.User;

public interface UserDao {


    /**
     * 根据用户民查找用户信息
     *
     * @param username 用户名
     * @return 返回空则没有该用户
     */
    public User queryUserByUsername(String username);

    /**
     * 根据用户名和密码查找用户
     *
     * @param username
     * @param password
     * @return
     */
    public User queryUserByUsernameAndPassword(String username, String password);

    /**
     * 保存用户
     *
     * @param user
     * @return
     */
    public int saveUser(User user);
}
