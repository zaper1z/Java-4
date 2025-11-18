<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đăng Nhập</title>
    <jsp:include page="head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-5 col-lg-4">
                <div class="card shadow-lg">
                    <div class="card-header-theme">
                        <h4 class="mb-0"><i class="fa-solid fa-user-lock me-2"></i>ĐĂNG NHẬP</h4>
                    </div>
                    <div class="card-body p-4">
                        <c:if test="${not empty message}"><div class="alert alert-danger text-center py-2">${message}</div></c:if>
                        
                        <form action="login" method="post">
                            <div class="form-floating mb-3">
                                <input type="text" class="form-control" id="id" name="id" placeholder="username" required>
                                <label for="id">Tên đăng nhập</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input type="password" class="form-control" id="password" name="password" placeholder="password" required>
                                <label for="password">Mật khẩu</label>
                            </div>
                            <div class="form-check mb-3">
                                <input class="form-check-input" type="checkbox" name="remember" id="remember">
                                <label class="form-check-label" for="remember">Ghi nhớ tài khoản</label>
                            </div>
                            <button type="submit" class="btn btn-theme w-100 py-2 fw-bold">Đăng Nhập</button>
                        </form>
                    </div>
                    <div class="card-footer text-center bg-white py-3">
                        <small><a href="forgot-password" class="text-decoration-none">Quên mật khẩu?</a></small>
                        <hr class="my-2">
                        <small>Chưa có tài khoản? <a href="register" class="fw-bold text-primary text-decoration-none">Đăng ký ngay</a></small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer><div class="container text-center"><small>&copy; 2025 Poly Film</small></div></footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>