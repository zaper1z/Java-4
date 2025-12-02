package Dao;

import Entity.Video;
import Utils.JpaUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class VideoDAOImpl implements VideoDAO {

    @Override
    public Video findById(String id) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            return em.find(Video.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Video> findAll() {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT v FROM Video v";
            TypedQuery<Video> query = em.createQuery(jpql, Video.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public Video create(Video video) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(video);
            trans.commit();
            return video;
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi thêm mới Video: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public void update(Video video) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(video);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi cập nhật Video: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(String id) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            Video video = em.find(Video.class, id);
            if (video != null) {
                em.remove(video);
            }
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi xóa Video: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Video> findSixMostViewed() {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT v FROM Video v WHERE v.active = true ORDER BY v.views DESC";
            TypedQuery<Video> query = em.createQuery(jpql, Video.class);
            query.setMaxResults(6); // Chỉ lấy 6 video
            return query.getResultList();
        } finally {
            em.close();
        }
    }
}
