<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Ký</title>
    <jsp:include page="head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container">
        <div class="row justify-content-center mt-5 mb-5">
            <div class="col-md-6 col-lg-5">
                <div class="card shadow-lg">
                    <div class="card-header-theme bg-success"> <h4 class="mb-0"><i class="fa-solid fa-user-plus me-2"></i>ĐĂNG KÝ TÀI KHOẢN</h4>
                    </div>
                    <div class="card-body p-4">
                        <c:if test="${not empty message}"><div class="alert alert-success text-center">${message}</div></c:if>
                        <c:if test="${not empty error}"><div class="alert alert-danger text-center">${error}</div></c:if>

                        <form action="register" method="post">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Tên đăng nhập</label>
                                <input type="text" name="id" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Mật khẩu</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Họ và tên</label>
                                <input type="text" name="fullname" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Email</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-success w-100 py-2 fw-bold">Đăng Ký</button>
                        </form>
                    </div>
                    <div class="card-footer text-center bg-white">
                        <small>Đã có tài khoản? <a href="login" class="fw-bold text-decoration-none">Đăng nhập</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer><div class="container text-center"><small>&copy; 2025 Poly Film</small></div></footer>
</body>
</html>