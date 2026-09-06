<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Đăng nhập</title>
</head>
<body>
<div class="container mt-5" style="max-width:400px">
  <h2>Đăng Nhập</h2>
  <c:if test="${alert != null}">
    <div class="alert alert-danger">${alert}</div>
  </c:if>
  <form action="login" method="post" onsubmit="return validateLogin()">
    <div class="form-group">
      <input type="text" class="form-control" id="username" name="username" placeholder="Tài khoản"/>
      <small id="errUsername" class="text-danger"></small>
    </div>
    <div class="form-group">
      <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu"/>
      <small id="errPassword" class="text-danger"></small>
    </div>
    <label><input type="checkbox" name="remember"/> Nhớ tôi</label><br/><br/>
    <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
  </form>
  <br/>
  <a href="register">Chưa có tài khoản? Đăng ký</a>
</div>
<script>
function validateLogin() {
  let valid = true;
  const username = document.getElementById('username').value.trim();
  const password = document.getElementById('password').value.trim();

  document.getElementById('errUsername').innerText = '';
  document.getElementById('errPassword').innerText = '';

  if (username === '') {
    document.getElementById('errUsername').innerText = 'Vui lòng nhập tài khoản';
    valid = false;
  }
  if (password === '') {
    document.getElementById('errPassword').innerText = 'Vui lòng nhập mật khẩu';
    valid = false;
  } else if (password.length < 6) {
    document.getElementById('errPassword').innerText = 'Mật khẩu phải ít nhất 6 ký tự';
    valid = false;
  }
  return valid;
}
</script>
</body>
</html>