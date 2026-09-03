<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Tất cả sản phẩm</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <h3>Tất cả sản phẩm</h3>
  <div class="row">
    <c:forEach items="${products}" var="p">
      <div class="col-md-4 mb-4">
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

  <c:if test="${totalPages > 0}">
    <nav>
      <ul class="pagination">
        <c:forEach begin="0" end="${totalPages - 1}" var="i">
          <li class="page-item ${currentPage == i ? 'active' : ''}">
            <a class="page-link" href="product?page=${i}">${i + 1}</a>
          </li>
        </c:forEach>
      </ul>
    </nav>
  </c:if>

</div>
</body>
</html>