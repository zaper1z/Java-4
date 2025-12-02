package Utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class JpaUtils {

    private static EntityManagerFactory factory;

    // Khối static này sẽ chạy 1 lần duy nhất khi lớp được nạp
    static {
        try {
            // "PolyOE" là tên bạn đặt trong file persistence.xml
            factory = Persistence.createEntityManagerFactory("PolyOE");
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi khởi tạo EntityManagerFactory.");
        }
    }

    /**
     * Lấy EntityManager (dùng cho mỗi lần truy vấn)
     */
    public static EntityManager getEntityManager() {
        return factory.createEntityManager();
    }

    /**
     * Đóng Factory khi ứng dụng dừng (có thể gọi trong contextDestroyed của Listener)
     */
    public static void shutdown() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }
}
