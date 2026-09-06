<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Trang chủ</title>
</head>
<body>
<div class="container mt-4">

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