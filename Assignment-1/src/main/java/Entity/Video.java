package Entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "Videos")
public class Video implements Serializable {

    @Id
    @Column(name = "VideoId")
    String id;

    @Column(name = "Title")
    String title;

    @Column(name = "Poster")
    String poster;

    @Column(name = "Views")
    Integer views = 0;

    @Column(name = "Description")
    String description;

    @Column(name = "Active")
    Boolean active = true;

    @OneToMany(mappedBy = "video")
    List<Favorite> favorites;

    // --- Getters and Setters ---

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public List<Favorite> getFavorites() {
        return favorites;
    }

    public void setFavorites(List<Favorite> favorites) {
        this.favorites = favorites;
    }
}
