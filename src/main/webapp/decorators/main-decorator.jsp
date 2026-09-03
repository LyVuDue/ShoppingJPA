<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title><decorator:title default="Shopping" /></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <decorator:head />
    <style>
        body { background-color: #f5f6fa; }
        .navbar-brand { font-weight: bold; }
        .page-wrapper { max-width: 900px; margin: 0 auto; }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand navbar-light bg-white shadow-sm mb-4">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Shopping</a>
            <div class="ml-auto">
                <a href="${pageContext.request.contextPath}/product" class="btn btn-outline-primary btn-sm mr-2">Tat ca san pham</a>
                <c:if test="${sessionScope.account != null}">
                    <a href="${pageContext.request.contextPath}/profile" class="btn btn-outline-secondary btn-sm mr-2">Ho so cua toi</a>
                    <span class="mr-2">Xin chao, <strong>${sessionScope.account.fullname}</strong></span>
                    <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Dang xuat</a>
                </c:if>
                <c:if test="${sessionScope.account == null}">
                    <a href="${pageContext.request.contextPath}/login" class="btn btn-primary btn-sm">Dang nhap</a>
                </c:if>
            </div>
        </div>
    </nav>

    <div class="container page-wrapper mb-5">
        <decorator:body />
    </div>

    <footer class="text-center text-muted py-3">
        <small>&copy; ShoppingJPA</small>
    </footer>
</body>
</html>