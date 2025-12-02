package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.FavoriteDAO;
import Entity.Favorite;
import Entity.User;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.util.List;

import java.io.IOException;

@WebServlet("/favorites")
public class FavoriteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Filter đã lo việc kiểm tra login
        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("currentUser");

        // [Giả định] Bạn có FavoriteDAO
        FavoriteDAO favoriteDAO = new FavoriteDAO() {
            @Override
            public Favorite findById(Long id) {
                return null;
            }

            @Override
            public List<Favorite> findAll() {
                return List.of();
            }

            @Override
            public Favorite create(Favorite favorite) {
                return null;
            }

            @Override
            public void update(Favorite favorite) {

            }

            @Override
            public void delete(Long id) {

            }

            @Override
            public List<Favorite> findByUser(String username) {
                return List.of();
            }

            @Override
            public Favorite findByUserAndVideo(String username, String videoId) {
                return null;
            }
        };
        List<Favorite> favorites = favoriteDAO.findByUser(currentUser.getId());

        request.setAttribute("favoriteList", favorites);
        request.getRequestDispatcher("/views/user/favorites.jsp").forward(request, response);
    }
}