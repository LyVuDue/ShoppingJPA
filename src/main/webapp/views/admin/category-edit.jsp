<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Sửa danh mục</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4" style="max-width:500px">
  <h2>Chỉnh sửa danh mục</h2>
  <form action="<c:url value='/admin/category/update'/>" method="post" enctype="multipart/form-data">
    <input type="text" name="categoryid" value="${cate.categoryId}" hidden="hidden"/>
    <div class="form-group">
      <label>Category name:</label>
      <input type="text" class="form-control" id="categoryname" name="categoryname" value="${cate.categoryname}"/>
    </div>
    <div class="form-group">
      <label>Link images:</label>
      <input type="text" class="form-control" id="images" name="images" value="${cate.images}"/>
    </div>
    <div class="form-group">
      <c:url value="/image?fname=${cate.images}" var="imgUrl"/>
      <img height="150" width="200" src="${imgUrl}"/><br/>
      <label>Upload images:</label>
      <input type="file" id="images1" name="images1"/>
    </div>
    <div class="form-group">
      <label>Status</label><br/>
      <input type="radio" name="status" value="1" ${cate.status == 1 ? 'checked' : ''}/>
      <label>Hoạt động</label><br/>
      <input type="radio" name="status" value="0" ${cate.status != 1 ? 'checked' : ''}/>
      <label>Khóa</label>
    </div>
    <input type="submit" class="btn btn-primary" value="Update"/>
  </form>
</div>
</body>
</html>