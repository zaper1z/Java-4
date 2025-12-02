package Dao;

import Entity.Favorite;
import Utils.JpaUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

public class FavoriteDAOImpl implements FavoriteDAO {

    @Override
    public Favorite findById(Long id) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            return em.find(Favorite.class, id);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Favorite> findAll() {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT f FROM Favorite f";
            TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public Favorite create(Favorite favorite) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(favorite);
            trans.commit();
            return favorite;
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi thêm mới Favorite: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public void update(Favorite favorite) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.merge(favorite);
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi cập nhật Favorite: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(Long id) {
        EntityManager em = JpaUtils.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            Favorite favorite = em.find(Favorite.class, id);
            if (favorite != null) {
                em.remove(favorite);
            }
            trans.commit();
        } catch (Exception e) {
            trans.rollback();
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi xóa Favorite: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Favorite> findByUser(String username) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :username";
            TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
            query.setParameter("username", username);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public Favorite findByUserAndVideo(String username, String videoId) {
        EntityManager em = JpaUtils.getEntityManager();
        try {
            String jpql = "SELECT f FROM Favorite f WHERE f.user.id = :username AND f.video.id = :videoId";
            TypedQuery<Favorite> query = em.createQuery(jpql, Favorite.class);
            query.setParameter("username", username);
            query.setParameter("videoId", videoId);
            List<Favorite> result = query.getResultList();
            return result.isEmpty() ? null : result.get(0);
        } finally {
            em.close();
        }
    }
}