<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Quên Mật Khẩu</title>
    <jsp:include page="head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card shadow">
                    <div class="card-header-theme">
                        <h5 class="mb-0"><i class="fa-solid fa-circle-question me-2"></i>KHÔI PHỤC MẬT KHẨU</h5>
                    </div>
                    <div class="card-body p-4">
                        <p class="text-muted text-center small">Nhập thông tin tài khoản để nhận lại mật khẩu qua Email.</p>
                        <c:if test="${not empty error}"><div class="alert alert-danger">${error}</div></c:if>
                        <c:if test="${not empty message}"><div class="alert alert-success">${message}</div></c:if>

                        <form action="forgot-password" method="POST">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Tên đăng nhập</label>
                                <input type="text" name="id" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Email đăng ký</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>
                            <button type="submit" class="btn btn-theme w-100">Gửi mật khẩu</button>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <a href="login" class="text-decoration-none small">Quay lại đăng nhập</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <footer><div class="container text-center"><small>&copy; 2025 Poly Film</small></div></footer>
</body>
</html>