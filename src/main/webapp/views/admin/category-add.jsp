<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
  <title>Thêm danh mục</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-4" style="max-width:500px">
  <h2>Thêm danh mục</h2>
  <form action="<c:url value='/admin/category/insert'/>" method="post" enctype="multipart/form-data">
    <div class="form-group">
      <label>Category name:</label>
      <input type="text" class="form-control" id="categoryname" name="categoryname"/>
    </div>
    <div class="form-group">
      <label>Link images:</label>
      <input type="text" class="form-control" id="images" name="images"/>
    </div>
    <div class="form-group">
      <label>Upload images:</label>
      <input type="file" id="images1" name="images1"/>
    </div>
    <div class="form-group">
      <label>Status</label><br/>
      <input type="radio" id="ston" name="status" value="1"/>
      <label>Hoạt động</label><br/>
      <input type="radio" id="stoff" name="status" value="0"/>
      <label>Khóa</label>
    </div>
    <input type="submit" class="btn btn-primary" value="Insert"/>
  </form>
</div>
</body>
</html>