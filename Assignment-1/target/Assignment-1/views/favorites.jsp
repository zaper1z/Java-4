<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Yêu Thích</title>
    <jsp:include page="head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container mt-4 mb-5">
        <div class="alert alert-primary d-flex align-items-center shadow-sm" role="alert">
            <i class="fa-solid fa-heart text-danger fa-2x me-3"></i>
            <div>
                <h4 class="alert-heading mb-0">Danh Sách Yêu Thích</h4>
                <p class="mb-0">Những video bạn đã lưu lại.</p>
            </div>
        </div>

        <div class="row row-cols-1 row-cols-md-3 row-cols-lg-4 g-4">
            <c:forEach var="fav" items="${favoriteList}">
                <div class="col">
                    <div class="card h-100 shadow-sm border-0">
                        <a href="detail?id=${fav.video.id}">
                            <img src="poster/${fav.video.poster}" class="card-img-top" style="height: 180px; object-fit: cover;">
                        </a>
                        <div class="card-body">
                            <h6 class="card-title text-truncate fw-bold">${fav.video.title}</h6>
                            <p class="card-text"><small class="text-muted">Ngày thích: ${fav.likeDate}</small></p>
                        </div>
                        <div class="card-footer bg-white border-0 d-flex justify-content-between">
                            <a href="unlike?id=${fav.video.id}" class="btn btn-sm btn-outline-danger w-100 me-1">Bỏ thích</a>
                            <a href="share?id=${fav.video.id}" class="btn btn-sm btn-outline-secondary w-100 ms-1">Chia sẻ</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty favoriteList}">
                <div class="col-12 text-center mt-5">
                    <p class="text-muted display-6">Danh sách trống!</p>
                    <a href="index" class="btn btn-primary">Quay lại xem phim</a>
                </div>
            </c:if>
        </div>
    </div>

    <footer><div class="container text-center"><small>&copy; 2025 Poly Film</small></div></footer>
</body>
</html>