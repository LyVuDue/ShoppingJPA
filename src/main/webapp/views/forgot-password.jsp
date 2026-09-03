<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Quên mật khẩu</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5" style="max-width:400px">
  <h2>Quên mật khẩu</h2>
  <c:if test="${alert != null}">
    <div class="alert alert-danger">${alert}</div>
  </c:if>
  <form action="forgot-password" method="post">
    <div class="form-group">
      <input type="email" class="form-control" name="email" placeholder="Nhập email của bạn" required/>
    </div>
    <button type="submit" class="btn btn-primary btn-block">Gửi OTP</button>
  </form>
  <br/>
  <a href="login">Quay lại đăng nhập</a>
</div>
</body>
</html>