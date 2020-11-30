package book.web;

import book.domain.User;
import book.service.UserService;
import book.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    UserService userService = new UserServiceImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1.获取参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        // 2.调用UserService
        User loginUser = userService.login(new User(null, username, password, null, null));
        if (loginUser == null) {
            // 调回登录页面
            req.setAttribute("errorMsg", "用户名或密码错误");
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        } else {
            req.getSession().setAttribute("loginUser", loginUser);
            if ("admin".equals(loginUser.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/pages/manager/manager.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/pages/user/login_success.jsp");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
