<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Sửa sản phẩm</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4" style="max-width:600px">
  <h2>Sửa sản phẩm</h2>
  <form action="<c:url value='/admin/product/update'/>" method="post" enctype="multipart/form-data">
    <input type="hidden" name="productId" value="${product.productId}"/>
    <div class="form-group">
      <label>Tên sản phẩm:</label>
      <input type="text" class="form-control" name="productname" value="${product.productname}" required/>
    </div>
    <div class="form-group">
      <label>Giá:</label>
      <input type="number" class="form-control" name="price" value="${product.price}" required/>
    </div>
    <div class="form-group">
      <label>Mô tả:</label>
      <textarea class="form-control" name="description">${product.description}</textarea>
    </div>
    <div class="form-group">
      <label>Số lượng:</label>
      <input type="number" class="form-control" name="quantity" value="${product.quantity}" required/>
    </div>
    <div class="form-group">
      <label>Danh mục:</label>
      <select class="form-control" name="categoryId">
        <c:forEach items="${categories}" var="c">
          <option value="${c.categoryId}" ${product.category.categoryId == c.categoryId ? 'selected' : ''}>${c.categoryname}</option>
        </c:forEach>
      </select>
    </div>
    <div class="form-group">
      <c:url value="/image?fname=${product.images}" var="imgUrl"/>
      <img src="${imgUrl}" height="100"/><br/>
      <label>Ảnh mới:</label>
      <input type="file" name="images"/>
    </div>
    <div class="form-group">
      <label>Trạng thái:</label><br/>
      <input type="radio" name="status" value="1" ${product.status == 1 ? 'checked' : ''}/> Hoạt động
      <input type="radio" name="status" value="0" ${product.status != 1 ? 'checked' : ''}/> Khóa
    </div>
    <input type="submit" class="btn btn-primary" value="Cập nhật"/>
  </form>
</div>
</body>
</html>