package Dao;

import Entity.Video;
import java.util.List;

public interface VideoDAO {
    Video findById(String id);
    List<Video> findAll();
    Video create(Video video);
    void update(Video video);
    void delete(String id);

    // Hàm đặc biệt cho Trang chủ
    List<Video> findSixMostViewed();
}