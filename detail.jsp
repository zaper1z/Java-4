<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${video.title}</title>
    <jsp:include page="head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container mt-4 mb-5">
        <div class="row">
            <div class="col-lg-8">
                <div class="card shadow mb-4">
                    <div class="ratio ratio-16x9">
                        <iframe src="https://www.youtube.com/embed/${video.id}" title="${video.title}" allowfullscreen></iframe>
                    </div>
                    <div class="card-body">
                        <h3 class="card-title fw-bold" style="color: #2c3e50;">${video.title}</h3>
                        <div class="d-flex justify-content-between align-items-center my-3">
                            <span class="badge bg-secondary p-2"><i class="fa-solid fa-eye me-1"></i> ${video.views} Lượt xem</span>
                            <div>
                                <a href="like?id=${video.id}" class="btn btn-outline-danger btn-sm"><i class="fa-regular fa-heart me-1"></i> Thích</a>
                                <a href="share?id=${video.id}" class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-share me-1"></i> Chia sẻ</a>
                            </div>
                        </div>
                        <hr class="text-muted">
                        <h5 class="fw-bold">Mô tả nội dung</h5>
                        <p class="card-text text-secondary">${video.description}</p>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card shadow-sm">
                    <div class="card-header-theme">
                        <i class="fa-solid fa-clock-rotate-left me-2"></i>VIDEO ĐÃ XEM
                    </div>
                    <div class="list-group list-group-flush">
                        <c:forEach var="watched" items="${watchedList}">
                            <a href="detail?id=${watched.id}" class="list-group-item list-group-item-action d-flex align-items-center p-2">
                                <img src="poster/${watched.poster}" class="rounded me-3" width="70" height="50" style="object-fit: cover;">
                                <div>
                                    <h6 class="mb-0 text-dark fw-bold" style="font-size: 0.95rem;">${watched.title}</h6>
                                    <small class="text-muted">Xem lại</small>
                                </div>
                            </a>
                        </c:forEach>
                        <c:if test="${empty watchedList}">
                            <div class="p-3 text-center text-muted">Chưa có lịch sử xem.</div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer><div class="container text-center"><small>&copy; 2025 Poly Film</small></div></footer>
</body>
</html>