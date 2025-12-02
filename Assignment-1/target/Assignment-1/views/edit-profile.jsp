<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Hồ Sơ Cá Nhân</title>
    <jsp:include page="head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="menu.jsp"></jsp:include>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card shadow">
                    <div class="card-header-theme">
                        <h5 class="mb-0"><i class="fa-solid fa-user-pen me-2"></i>CẬP NHẬT HỒ SƠ</h5>
                    </div>
                    <div class="card-body p-4">
                        <p class="text-center text-success fw-bold">${message}</p>
                        
                        <form action="edit-profile" method="POST">
                            <div class="mb-3 row">
                                <label class="col-sm-3 col-form-label fw-bold">Username</label>
                                <div class="col-sm-9">
                                    <input type="text" name="id" value="${sessionScope.currentUser.id}" class="form-control-plaintext bg-light px-2 fw-bold" readonly>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label class="col-sm-3 col-form-label fw-bold">Họ và tên</label>
                                <div class="col-sm-9">
                                    <input type="text" name="fullname" value="${sessionScope.currentUser.fullname}" class="form-control" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label class="col-sm-3 col-form-label fw-bold">Email</label>
                                <div class="col-sm-9">
                                    <input type="email" name="email" value="${sessionScope.currentUser.email}" class="form-control" required>
                                </div>
                            </div>
                            <div class="text-end">
                                <button type="submit" class="btn btn-theme px-4">Cập nhật</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <footer><div class="container text-center"><small>&copy; 2025 Poly Film</small></div></footer>
</body>
</html>