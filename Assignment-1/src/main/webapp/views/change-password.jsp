<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đổi Mật Khẩu</title>
    <jsp:include page="head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header-theme bg-warning text-dark"> <h5 class="mb-0 text-white"><i class="fa-solid fa-key me-2"></i>ĐỔI MẬT KHẨU</h5>
                    </div>
                    <div class="card-body p-4">
                        <p class="text-center text-success">${message}</p>
                        <p class="text-center text-danger">${error}</p>
                        
                        <form action="change-password" method="POST">
                            <div class="mb-3">
                                <label class="form-label fw-bold">Tài khoản</label>
                                <input type="text" name="id" value="${sessionScope.currentUser.id}" class="form-control" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Mật khẩu hiện tại</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Mật khẩu mới</label>
                                <input type="password" name="newPassword" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-bold">Xác nhận mật khẩu mới</label>
                                <input type="password" name="confirmPassword" class="form-control" required>
                            </div>
                            <button class="btn btn-warning w-100 fw-bold text-white">Xác nhận đổi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <footer><div class="container text-center"><small>&copy; 2025 Poly Film</small></div></footer>
</body>
</html>