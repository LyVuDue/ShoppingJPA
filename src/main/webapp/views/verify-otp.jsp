<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Xác nhận OTP</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5" style="max-width:400px">
  <h2>Nhập mã OTP</h2>
  <p>Mã OTP đã được gửi đến email của bạn.</p>
  <c:if test="${alert != null}">
    <div class="alert alert-danger">${alert}</div>
  </c:if>
  <form action="verify-otp" method="post">
    <div class="form-group">
      <input type="text" class="form-control" name="otp" placeholder="Nhập mã OTP" required/>
    </div>
    <button type="submit" class="btn btn-primary btn-block">Xác nhận</button>
  </form>
</div>
</body>
</html>