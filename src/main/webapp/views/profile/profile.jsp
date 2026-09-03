<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<html>
<head>
    <title>Ho so ca nhan</title>
</head>
<body>

<h3 class="mb-4">Ho so ca nhan</h3>

<c:if test="${not empty message}">
    <div class="alert alert-success">${message}</div>
</c:if>
<c:if test="${not empty error}">
    <div class="alert alert-danger">${error}</div>
</c:if>

<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-md-3 text-center mb-3">
                <c:choose>
                    <c:when test="${not empty user.avatar}">
                        <c:url value="/image?fname=${user.avatar}" var="avatarUrl"/>
                        <img src="${avatarUrl}" class="img-thumbnail rounded-circle" width="150" height="150" style="object-fit: cover;"/>
                    </c:when>
                    <c:otherwise>
                        <div class="rounded-circle bg-secondary text-white d-flex align-items-center justify-content-center mx-auto" style="width:150px;height:150px;font-size:48px;">
                            ${fn:substring(user.fullname, 0, 1)}
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="col-md-9">
                <form action="${pageContext.request.contextPath}/profile/update" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Ten dang nhap</label>
                        <input type="text" class="form-control" value="${user.username}" disabled />
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input type="text" class="form-control" value="${user.email}" disabled />
                    </div>
                    <div class="form-group">
                        <label>Ho va ten <span class="text-danger">*</span></label>
                        <input type="text" name="fullname" class="form-control" value="${user.fullname}" required maxlength="100" />
                    </div>
                    <div class="form-group">
                        <label>So dien thoai</label>
                        <input type="text" name="phone" class="form-control" value="${user.phone}" pattern="[0-9]{9,11}" maxlength="11" placeholder="VD: 0901234567" />
                    </div>
                    <div class="form-group">
                        <label>Anh dai dien</label>
                        <input type="file" name="avatar" class="form-control-file" accept="image/*" />
                        <small class="form-text text-muted">Chon anh moi de thay doi avatar hien tai (dinh dang jpg, png...)</small>
                    </div>
                    <button type="submit" class="btn btn-primary">Luu thay doi</button>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">Huy</a>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>