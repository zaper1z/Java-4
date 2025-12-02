package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.UserDAO;
import Entity.User;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.util.List;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/user/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Lấy thông tin từ form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");

        try {
            UserDAO userDAO = new UserDAO() {
                @Override
                public User findById(String id) {
                    return null;
                }

                @Override
                public void create(User user) {

                }

                @Override
                public void update(User user) {

                }

                @Override
                public void delete(String id) {

                }
            };

            // 2. Kiểm tra logic (ví dụ: username đã tồn tại chưa)
            if (userDAO.findById(username) != null) {
                request.setAttribute("error", "Username đã tồn tại!");
                request.getRequestDispatcher("/views/user/register.jsp").forward(request, response);
            } else {
                // 3. Tạo user mới (nhớ mã hóa mật khẩu)
                User newUser = new User();
                newUser.setId(username);
                newUser.setPassword(password); // Nhớ mã hóa!
                newUser.setFullname(fullname);
                newUser.setEmail(email);
                newUser.setAdmin(false); // Mặc định là user

                userDAO.create(newUser);

                // 4. [Nâng cao] Gửi email chào mừng (tạm bỏ qua nếu gấp)

                request.setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
                request.getRequestDispatcher("/views/user/login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
            request.getRequestDispatcher("/views/user/register.jsp").forward(request, response);
        }
    }
}