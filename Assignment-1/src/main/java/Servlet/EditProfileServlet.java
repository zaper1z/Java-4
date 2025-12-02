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

@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Form tự động điền thông tin từ session
        request.getRequestDispatcher("/views/user/edit-profile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        // 1. Lấy thông tin mới
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");

        // 2. Cập nhật
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
        currentUser.setFullname(fullname);
        currentUser.setEmail(email);
        userDAO.update(currentUser);

        // 3. Cập nhật lại session
        session.setAttribute("currentUser", currentUser);

        request.setAttribute("message", "Cập nhật thành công!");
        request.getRequestDispatcher("/views/user/edit-profile.jsp").forward(request, response);
    }
}