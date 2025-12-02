package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.UserDAO;
import Entity.User;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.util.List;

import java.io.IOException;

@WebServlet("/change-password")
public class ChangePasswordServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/user/change-password.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        String currentPass = request.getParameter("currentPassword");
        String newPass = request.getParameter("newPassword");
        String confirmPass = request.getParameter("confirmNewPassword");

        // 1. Kiểm tra pass cũ có đúng không (nhớ mã hóa)
        if (!currentUser.getPassword().equals(currentPass)) {
            request.setAttribute("error", "Mật khẩu hiện tại không đúng!");
        }
        // 2. Kiểm tra pass mới có trùng không
        else if (!newPass.equals(confirmPass)) {
            request.setAttribute("error", "Mật khẩu mới không trùng khớp!");
        }
        // 3. Thành công
        else {
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
            currentUser.setPassword(newPass); // Nhớ mã hóa
            userDAO.update(currentUser);

            // Cập nhật lại session
            session.setAttribute("currentUser", currentUser);
            request.setAttribute("message", "Đổi mật khẩu thành công!");
        }

        request.getRequestDispatcher("/views/user/change-password.jsp").forward(request, response);
    }
}