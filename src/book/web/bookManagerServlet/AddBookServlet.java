package book.web.bookManagerServlet;

import book.domain.Book;
import book.service.BookService;
import book.service.impl.BookServiceImpl;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

public class AddBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        // 获取参数
        Map<String, String> map = new HashMap<>();
        Book book = new Book();

        // 封装bean对象
        try {
            BeanUtils.populate(book, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        // 处理文件
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // 设置文件缓存目录
        File f = new File(req.getContextPath() + "/static/temp");
        f.mkdirs();
        factory.setRepository(f);
        ServletFileUpload fileUpload = new ServletFileUpload(factory);
        fileUpload.setHeaderEncoding("utf-8");

        try {
            List<FileItem> list = fileUpload.parseRequest(req);
            System.out.println(list);
            for (FileItem fileItem : list) {
                if (!fileItem.isFormField() && fileItem.getName() != null && !"".equals(fileItem.getName())) {
                    String filName = fileItem.getName();
                    //利用UUID生成伪随机字符串，作为文件名避免重复
                    String uuid = UUID.randomUUID().toString();
                    //获取文件后缀名
                    String suffix = filName.substring(filName.lastIndexOf("."));

                    //获取文件上传目录路径，在项目部署路径下的upload目录里。若想让浏览器不能直接访问到图片，可以放在WEB-INF下
                    String uploadPath = req.getSession().getServletContext().getRealPath("/static/img");

                    File file = new File(uploadPath);
                    file.mkdirs();
                    //写入文件到磁盘，该行执行完毕后，若有该临时文件，将会自动删除
                    fileItem.write(new File(uploadPath, uuid + suffix));

                    book.setImg_path("static/img/" + uuid + suffix);
                } else {
                    String fieldName = fileItem.getFieldName();
                    String value = fileItem.getString("utf-8");
                    map.put(fieldName, value);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            BeanUtils.populate(book, map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        // 添加课本
        BookService service = new BookServiceImpl();
        service.addBook(book);

        // 返回管理页面
        resp.sendRedirect(req.getContextPath() + "/book/showAllBooksServlet");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }
}
