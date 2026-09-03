<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Trang chủ</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <nav class="navbar navbar-light bg-light mb-4">
    <a class="navbar-brand" href="home">Shopping</a>
    <div>
      <a href="product" class="btn btn-outline-primary mr-2">Tất cả sản phẩm</a>
      <c:if test="${sessionScope.account == null}">
        <a href="login" class="btn btn-primary">Đăng nhập</a>
      </c:if>
      <c:if test="${sessionScope.account != null}">
  		<a href="profile" class="btn btn-outline-secondary mr-2">Hồ sơ của tôi</a>
  		<span>Xin chào ${sessionScope.account.fullname}</span>
  		<a href="logout" class="btn btn-danger ml-2">Đăng xuất</a>
	  </c:if>
    </div>
  </nav>

  <h3>Sản phẩm mới nhất</h3>
  <div class="row">
    <c:forEach items="${top10}" var="p">
      <div class="col-md-3 mb-4">
        <div class="card">
          <c:url value="/image?fname=${p.images}" var="imgUrl"/>
          <img src="${imgUrl}" class="card-img-top" height="200"/>
          <div class="card-body">
            <h5 class="card-title">${p.productname}</h5>
            <p class="card-text text-danger">${p.price} đ</p>
            <a href="product/detail?id=${p.productId}" class="btn btn-primary btn-sm">Xem chi tiết</a>
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
</div>
</body>
</html>