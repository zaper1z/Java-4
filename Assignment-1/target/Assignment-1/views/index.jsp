<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <title>Poly Film - Giải Trí Đỉnh Cao</title>
    <jsp:include page="head.jsp"></jsp:include>
    <style>
        /* Banner sáng hơn */
        .hero-img { 
            height: 500px; 
            object-fit: cover; 
            filter: brightness(0.85); /* Sáng hơn bản cũ */
        }
        /* Gradient che chân ảnh để chữ dễ đọc mà ảnh vẫn sáng */
        .hero-overlay {
            position: absolute;
            bottom: 0; left: 0; right: 0;
            height: 50%;
            background: linear-gradient(to top, var(--bg-body), transparent);
        }
    </style>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div id="heroCarousel" class="carousel slide mb-5" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active position-relative">
                <img src="https://wallpapers.com/images/hd/avengers-infinity-war-4k-8k-1tqbdks3q0h4b54g.jpg" class="d-block w-100 hero-img" alt="Banner 1">
                <div class="hero-overlay"></div> <div class="carousel-caption d-none d-md-block text-start container pb-5">
                    <h2 class="display-4 fw-bold text-white" style="text-shadow: 0 0 20px rgba(0,0,0,0.8);">
                        SIÊU PHẨM <span class="text-gradient">BOM TẤN</span>
                    </h2>
                    <p class="fs-5 text-light">Trải nghiệm điện ảnh sống động ngay tại nhà.</p>
                    <a href="#trending" class="btn btn-gradient btn-lg rounded-pill px-4 mt-2">
                        <i class="fa-solid fa-play me-2"></i> Xem Ngay
                    </a>
                </div>
            </div>
            <div class="carousel-item position-relative">
                <img src="https://images.hdqwalls.com/wallpapers/avatar-the-way-of-water-5k-1a.jpg" class="d-block w-100 hero-img" alt="Banner 2">
                <div class="hero-overlay"></div>
                <div class="carousel-caption d-none d-md-block text-start container pb-5">
                    <h2 class="display-4 fw-bold text-white">
                        KHÁM PHÁ <span class="text-gradient">THẾ GIỚI MỚI</span>
                    </h2>
                    <p class="fs-5 text-light">Hàng ngàn video 4K sắc nét đang chờ đón.</p>
                    <a href="#trending" class="btn btn-gradient btn-lg rounded-pill px-4 mt-2">
                        <i class="fa-solid fa-fire me-2"></i> Thịnh Hành
                    </a>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>

    <div class="container pb-5" id="trending">
        <div class="d-flex align-items-center mb-4">
            <h3 class="mb-0 fw-bold text-white border-start border-4 border-danger ps-3">
                TOP <span class="text-gradient">TRENDING</span>
            </h3>
            <a href="#" class="ms-auto text-decoration-none text-secondary small">Xem tất cả <i class="fa-solid fa-arrow-right"></i></a>
        </div>

        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
            <c:forEach var="item" items="${items}">
                <div class="col">
                    <div class="movie-card h-100">
                        <a href="detail?id=${item.id}" class="text-decoration-none">
                            <div class="poster-frame">
                                <img src="poster/${item.poster}" 
                                     onerror="this.src='https://via.placeholder.com/300x450/1e293b/ffffff?text=PolyFilm'" 
                                     alt="${item.title}">
                                <div class="card-overlay">
                                    <span class="btn btn-danger rounded-circle shadow-lg" style="width: 50px; height: 50px; line-height: 38px;">
                                        <i class="fa-solid fa-play fs-5"></i>
                                    </span>
                                </div>
                            </div>
                            
                            <div class="p-3">
                                <h6 class="card-title text-white text-truncate mb-1" title="${item.title}">${item.title}</h6>
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted"><i class="fa-regular fa-eye me-1"></i>${item.views}</small>
                                    <div class="text-warning small">
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star"></i>
                                        <i class="fa-solid fa-star-half-stroke"></i>
                                    </div>
                                </div>
                            </div>
                        </a>
                        <div class="card-footer bg-transparent border-top border-secondary border-opacity-10 d-flex justify-content-between py-2">
                             <a href="like?id=${item.id}" class="text-secondary hover-danger"><i class="fa-regular fa-heart"></i> Thích</a>
                             <a href="share?id=${item.id}" class="text-secondary hover-primary"><i class="fa-solid fa-share"></i> Share</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="d-flex justify-content-center mt-5">
            <nav>
                <ul class="pagination">
                    <li class="nav-item">
                        <a class="nav-link bg-transparent text-secondary border-secondary" href="index?page=${currentPage-1}">Prev</a>
                    </li>
                    <li class="nav-item">
                        <span class="nav-link text-white fw-bold" style="background: var(--neon-orange); border-color: var(--neon-orange);">${currentPage + 1}</span>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link bg-transparent text-secondary border-secondary" href="index?page=${currentPage+1}">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <footer>
        <div class="container text-center">
            <h4 class="fw-bold mb-3 text-white">POLY <span class="text-gradient">FILM</span></h4>
            <p class="small mb-4 opacity-75">Mang cả rạp chiếu phim về ngôi nhà của bạn.</p>
            
            <div class="mb-4 social-icons">
                <a href="#" class="btn btn-outline-light btn-sm rounded-circle me-2" style="width: 40px; height: 40px;"><i class="fa-brands fa-facebook-f lh-base"></i></a>
                <a href="#" class="btn btn-outline-light btn-sm rounded-circle me-2" style="width: 40px; height: 40px;"><i class="fa-brands fa-youtube lh-base"></i></a>
                <a href="#" class="btn btn-outline-light btn-sm rounded-circle" style="width: 40px; height: 40px;"><i class="fa-brands fa-tiktok lh-base"></i></a>
            </div>
            
            <div class="border-top border-secondary border-opacity-25 pt-3 small">
                &copy; 2025 Assignment Java 4. All rights reserved.
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        .hover-danger:hover { color: #ff6b6b !important; }
        .hover-primary:hover { color: #7c4dff !important; }
    </style>
</body>
</html>