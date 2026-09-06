<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Đăng ký</title>
</head>
<body>
<div class="container mt-5" style="max-width:400px">
  <h2>Tạo tài khoản mới</h2>
  <c:if test="${alert != null}">
    <div class="alert alert-danger">${alert}</div>
  </c:if>
  <form action="register" method="post" onsubmit="return validateRegister()">
    <div class="form-group">
      <input type="text" class="form-control" id="username" name="username" placeholder="Tài khoản"/>
      <small id="errUsername" class="text-danger"></small>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Họ tên"/>
      <small id="errFullname" class="text-danger"></small>
    </div>
    <div class="form-group">
      <input type="email" class="form-control" id="email" name="email" placeholder="Email"/>
      <small id="errEmail" class="text-danger"></small>
    </div>
    <div class="form-group">
      <input type="text" class="form-control" id="phone" name="phone" placeholder="Số điện thoại"/>
      <small id="errPhone" class="text-danger"></small>
    </div>
    <div class="form-group">
      <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu"/>
      <small id="errPassword" class="text-danger"></small>
    </div>
    <button type="submit" class="btn btn-success btn-block">Tạo tài khoản</button>
  </form>
  <br/>
  <a href="login">Đã có tài khoản? Đăng nhập</a>
</div>
<script>
function validateRegister() {
  let valid = true;
  const username = document.getElementById('username').value.trim();
  const fullname = document.getElementById('fullname').value.trim();
  const email    = document.getElementById('email').value.trim();
  const phone    = document.getElementById('phone').value.trim();
  const password = document.getElementById('password').value.trim();

  document.getElementById('errUsername').innerText = '';
  document.getElementById('errFullname').innerText = '';
  document.getElementById('errEmail').innerText    = '';
  document.getElementById('errPhone').innerText    = '';
  document.getElementById('errPassword').innerText = '';

  if (username === '') {
    document.getElementById('errUsername').innerText = 'Vui lòng nhập tài khoản';
    valid = false;
  } else if (username.length < 4) {
    document.getElementById('errUsername').innerText = 'Tài khoản phải ít nhất 4 ký tự';
    valid = false;
  }
  if (fullname === '') {
    document.getElementById('errFullname').innerText = 'Vui lòng nhập họ tên';
    valid = false;
  }
  if (email === '') {
    document.getElementById('errEmail').innerText = 'Vui lòng nhập email';
    valid = false;
  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    document.getElementById('errEmail').innerText = 'Email không hợp lệ';
    valid = false;
  }
  if (phone !== '' && !/^[0-9]{10}$/.test(phone)) {
    document.getElementById('errPhone').innerText = 'Số điện thoại phải 10 chữ số';
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