<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom sticky-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index">
            <i class="fa-solid fa-clapperboard me-2 text-warning"></i>POLY FILM
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="index"><i class="fa-solid fa-house me-1"></i> Trang chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="favorites"><i class="fa-solid fa-heart me-1"></i> Yêu thích</a></li>
            </ul>
            
            <ul class="navbar-nav ms-auto align-items-center">
                <c:choose>
                    <c:when test="${not empty sessionScope.currentUser}">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle btn btn-outline-light border-0" href="#" role="button" data-bs-toggle="dropdown">
                                <i class="fa-solid fa-circle-user me-1"></i> Xin chào, ${sessionScope.currentUser.fullname}
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0">
                                <c:if test="${sessionScope.currentUser.admin}">
                                    <li><a class="dropdown-item" href="admin/video"><i class="fa-solid fa-gauge me-2 text-primary"></i>Quản trị Admin</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                </c:if>
                                <li><a class="dropdown-item" href="edit-profile"><i class="fa-solid fa-user-pen me-2"></i>Cập nhật hồ sơ</a></li>
                                <li><a class="dropdown-item" href="change-password"><i class="fa-solid fa-key me-2"></i>Đổi mật khẩu</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="logoff"><i class="fa-solid fa-right-from-bracket me-2"></i>Đăng xuất</a></li>
                            </ul>
                        </li>
                    </c:when>
                    <c:otherwise>
                        <li class="nav-item"><a class="nav-link" href="login">Đăng nhập</a></li>
                        <li class="nav-item ms-2"><a class="btn btn-light text-dark btn-sm rounded-pill px-3 fw-bold" href="register">Đăng ký</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>