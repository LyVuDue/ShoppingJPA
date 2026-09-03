<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Đăng ký</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5" style="max-width:400px">
  <h2>Tạo tài khoản mới</h2>
  <c:if test="${alert != null}">
    <div class="alert alert-danger">${alert}</div>
  </c:if>
  <form action="register" method="post">
    <div class="form-group">
      <input type="text" class="form-control" name="username" placeholder="Tài khoản" required/>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" name="fullname" placeholder="Họ tên" required/>
    </div>
    <div class="form-group">
      <input type="email" class="form-control" name="email" placeholder="Email" required/>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" name="phone" placeholder="Số điện thoại"/>
    </div>
    <div class="form-group">
      <input type="password" class="form-control" name="password" placeholder="Mật khẩu" required/>
    </div>
    <button type="submit" class="btn btn-success btn-block">Tạo tài khoản</button>
  </form>
  <br/>
  <a href="login">Đã có tài khoản? Đăng nhập</a>
</div>
</body>
</html>