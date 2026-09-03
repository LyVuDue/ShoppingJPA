<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Đăng nhập</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5" style="max-width:400px">
  <h2>Đăng Nhập</h2>
  <c:if test="${alert != null}">
    <div class="alert alert-danger">${alert}</div>
  </c:if>
  <form action="login" method="post">
    <div class="form-group">
      <input type="text" class="form-control" name="username" placeholder="Tài khoản" required/>
    </div>
    <div class="form-group">
      <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required/>
    </div>
    <label><input type="checkbox" name="remember"/> Nhớ tôi</label><br/><br/>
    <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
  </form>
  <br/>
  <a href="register">Chưa có tài khoản? Đăng ký</a>
</div>
</body>
</html>