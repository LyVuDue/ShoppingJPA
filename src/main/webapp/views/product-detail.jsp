<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>${product.productname}</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <a href="product" class="btn btn-secondary mb-3">← Quay lại</a>
  <div class="row">
    <div class="col-md-5">
      <c:url value="/image?fname=${product.images}" var="imgUrl"/>
      <img src="${imgUrl}" class="img-fluid"/>
    </div>
    <div class="col-md-7">
      <h2>${product.productname}</h2>
      <h4 class="text-danger">${product.price} đ</h4>
      <p><strong>Danh mục:</strong> ${product.category.categoryname}</p>
      <p><strong>Còn lại:</strong> ${product.quantity} sản phẩm</p>
      <p><strong>Mô tả:</strong> ${product.description}</p>
    </div>
  </div>
</div>
</body>
</html>