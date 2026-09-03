<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Danh sách danh mục</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4">
  <h2>Quản lý danh mục</h2>
  <a href="<c:url value='/admin/category/add'/>" class="btn btn-primary mb-3">Thêm mới</a>
  <table class="table table-bordered">
    <tr>
      <th>STT</th>
      <th>Hình ảnh</th>
      <th>Tên danh mục</th>
      <th>Trạng thái</th>
      <th>Hành động</th>
    </tr>
    <c:forEach items="${listcate}" var="cate" varStatus="STT">
      <tr>
        <td>${STT.index + 1}</td>
        <td>
          <c:url value="/image?fname=${cate.images}" var="imgUrl"/>
          <img height="100" width="120" src="${imgUrl}"/>
        </td>
        <td>${cate.categoryname}</td>
        <td>
          <c:if test="${cate.status == 1}">Hoạt động</c:if>
          <c:if test="${cate.status != 1}">Khóa</c:if>
        </td>
        <td>
          <a href="<c:url value='/admin/category/edit?id=${cate.categoryId}'/>" class="btn btn-warning btn-sm">Sửa</a>
          <a href="<c:url value='/admin/category/delete?id=${cate.categoryId}'/>" class="btn btn-danger btn-sm">Xóa</a>
        </td>
      </tr>
    </c:forEach>
  </table>
</div>
</body>
</html>