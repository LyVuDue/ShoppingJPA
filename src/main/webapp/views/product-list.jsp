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
  <p>TEST: ${listproduct}</p>
  <a href="admin/product/add" class="btn btn-success mb-3">Thêm sản phẩm</a>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Số lượng</th>
        <th>Danh mục</th>
        <th>Hành động</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${listproduct}" var="p">
        <tr>
          <td>${p.productId}</td>
          <td>${p.productname}</td>
          <td>${p.price} đ</td>
          <td>${p.quantity}</td>
          <td>${p.category.categoryname}</td>
          <td>
            <a href="admin/product/edit?id=${p.productId}" class="btn btn-warning btn-sm">Sửa</a>
            <a href="admin/product/delete?id=${p.productId}" class="btn btn-danger btn-sm"
               onclick="return confirm('Xóa sản phẩm này?')">Xóa</a>
          </td>
        </tr>
      </c:forEach>
    </tbody>
  </table>
</div>
</body>
</html>
