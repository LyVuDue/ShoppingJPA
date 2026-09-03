<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Thêm sản phẩm</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4" style="max-width:600px">
  <h2>Thêm sản phẩm</h2>
  <form action="<c:url value='/admin/product/insert'/>" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label>Tên sản phẩm:</label>
      <input type="text" class="form-control" name="productname" required/>
    </div>
    <div class="form-group">
      <label>Giá:</label>
      <input type="number" class="form-control" name="price" required/>
    </div>
    <div class="form-group">
      <label>Mô tả:</label>
      <textarea class="form-control" name="description"></textarea>
    </div>
    <div class="form-group">
      <label>Số lượng:</label>
      <input type="number" class="form-control" name="quantity" required/>
    </div>
    <div class="form-group">
      <label>Danh mục:</label>
      <select class="form-control" name="categoryId">
        <c:forEach items="${categories}" var="c">
          <option value="${c.categoryId}">${c.categoryname}</option>
        </c:forEach>
      </select>
    </div>
    <div class="form-group">
      <label>Ảnh:</label>
      <input type="file" name="images"/>
    </div>
    <div class="form-group">
      <label>Trạng thái:</label><br/>
      <input type="radio" name="status" value="1"/> Hoạt động
      <input type="radio" name="status" value="0"/> Khóa
    </div>
    <input type="submit" class="btn btn-primary" value="Thêm"/>
  </form>
</div>
</body>
</html>