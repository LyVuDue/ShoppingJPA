<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Quên mật khẩu</title>
</head>
<body>
<div class="container mt-5" style="max-width:400px">
  <h2>Quên mật khẩu</h2>
  <c:if test="${alert != null}">
    <div class="alert alert-danger">${alert}</div>
  </c:if>
  <form action="forgot-password" method="post" onsubmit="return validateForgot()">
    <div class="form-group">
      <input type="email" class="form-control" id="email" name="email" placeholder="Nhập email của bạn"/>
      <small id="errEmail" class="text-danger"></small>
    </div>
    <button type="submit" class="btn btn-primary btn-block">Gửi OTP</button>
  </form>
  <br/>
  <a href="login">Quay lại đăng nhập</a>
</div>
<script>
function validateForgot() {
  let valid = true;
  const email = document.getElementById('email').value.trim();
  document.getElementById('errEmail').innerText = '';

  if (email === '') {
    document.getElementById('errEmail').innerText = 'Vui lòng nhập email';
    valid = false;
  } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
    document.getElementById('errEmail').innerText = 'Email không hợp lệ';
    valid = false;
  }
  return valid;
}
</script>
</body>
</html>