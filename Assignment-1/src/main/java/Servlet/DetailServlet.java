package Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.VideoDAO;
import Entity.Video;
import org.apache.commons.beanutils.BeanUtils;

import java.io.IOException;
import java.util.List;

import java.io.IOException;
@WebServlet("/detail")
public class DetailServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String videoId = request.getParameter("id");

        if (videoId == null) {
            response.sendRedirect("index");
            return;
        }

        VideoDAO videoDAO = new VideoDAO() {
            @Override
            public Video findById(String id) {
                return null;
            }

            @Override
            public List<Video> findAll() {
                return List.of();
            }

            @Override
            public Video create(Video video) {
                return null;
            }

            @Override
            public void update(Video video) {

            }

            @Override
            public void delete(String id) {

            }

            @Override
            public List<Video> findSixMostViewed() {
                return List.of();
            }
        };
        Video video = videoDAO.findById(videoId);

        if (video == null) {
            response.sendRedirect("index");
            return;
        }

        // 1. Tăng view count (theo yêu cầu ASM)
        video.setViews(video.getViews() + 1);
        videoDAO.update(video);

        // 2. Ghi nhận video đã xem vào cookie (theo yêu cầu ASM)
        // [Code xử lý cookie "watchedVideos" ở đây]
        // ...

        // 3. Lấy danh sách video đã xem từ cookie để hiển thị
        // [Code đọc cookie "watchedVideos" và lấy List<Video> ở đây]
        // ...

        request.setAttribute("video", video);
        // request.setAttribute("watchedList", ...); // Gửi danh sách đã xem

        request.getRequestDispatcher("/views/user/detail.jsp").forward(request, response);
    }
}