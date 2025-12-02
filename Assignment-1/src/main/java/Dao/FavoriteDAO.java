package Dao;

import Entity.Favorite;
import java.util.List;

public interface FavoriteDAO {
    Favorite findById(Long id);
    List<Favorite> findAll();
    Favorite create(Favorite favorite);
    void update(Favorite favorite);
    void delete(Long id);

    // Hàm đặc biệt cho trang Yêu thích
    List<Favorite> findByUser(String username);

    // Hàm kiểm tra video đã được like hay chưa
    Favorite findByUserAndVideo(String username, String videoId);
}
