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

@WebServlet("/forgot-password")
public class ForgotPasswordServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/user/forgot-password.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String email = request.getParameter("email");

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
        User user = userDAO.findById(username);

        if (user != null && user.getEmail().equals(email)) {
            // [Giả định] Bạn có 1 class MailUtils để gửi email
            // MailUtils.sendEmail(email, "Mật khẩu của bạn", "Mật khẩu: " + user.getPassword());

            request.setAttribute("message", "Mật khẩu đã được gửi về email của bạn!");
        } else {
            request.setAttribute("error", "Username hoặc Email không chính xác!");
        }

        request.getRequestDispatcher("/views/user/forgot-password.jsp").forward(request, response);
    }
}