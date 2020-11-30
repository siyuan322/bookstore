package book.service;

import book.domain.User;

public interface UserService {
    /**
     * 注册
     *
     * @param user
     */
    public void registerUser(User user);

    /**
     * 登录
     *
     * @param user
     */
    public User login(User user);

    /**
     * 是否存在用户名
     *
     * @param username
     * @return
     */
    public boolean existsUsername(String username);
}
