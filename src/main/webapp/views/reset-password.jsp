<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Đặt lại mật khẩu</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5" style="max-width:400px">
  <h2>Đặt lại mật khẩu</h2>
  <c:if test="${alert != null}">
    <div class="alert alert-danger">${alert}</div>
  </c:if>
  <form action="reset-password" method="post">
    <div class="form-group">
      <input type="text" class="form-control" name="otp" placeholder="Nhập mã OTP" required/>
    </div>
    <div class="form-group">
      <input type="password" class="form-control" name="newPassword" placeholder="Mật khẩu mới" required/>
    </div>
    <button type="submit" class="btn btn-primary btn-block">Đặt lại mật khẩu</button>
  </form>
</div>
</body>
</html>