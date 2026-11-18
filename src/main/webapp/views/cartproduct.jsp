<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Your cart | Perishable Shop</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <style>
        body { background: #f5f7f1; color: #26352a; }
        .cart-wrap { max-width: 1000px; margin: 48px auto; padding: 0 18px; }
        .cart-card { background: #fff; border: 1px solid #e4e9df; border-radius: 16px; padding: 24px; }
        .product-image { width: 72px; height: 72px; object-fit: cover; border-radius: 10px; }
        .total { font-size: 1.2rem; font-weight: 700; }
    </style>
</head>
<body>
<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Perishable Shop</a>
    <div><a class="btn btn-outline-light btn-sm" href="/user/products">Continue shopping</a>
        <a class="btn btn-outline-light btn-sm ml-2" href="/logout">Log out</a></div>
</nav>
<main class="cart-wrap">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h1 class="h2 mb-0">Your cart</h1>
        <a href="/user/products">Continue shopping</a>
    </div>
    <div class="cart-card">
        <c:choose>
            <c:when test="${empty cartItems}">
                <p class="mb-0">Your cart is empty. <a href="/user/products">Browse products</a> to add something.</p>
            </c:when>
            <c:otherwise>
                <div class="table-responsive">
                    <table class="table">
                        <thead><tr><th>Product</th><th>Price</th><th></th></tr></thead>
                        <tbody>
                        <c:forEach var="item" items="${cartItems}">
                            <tr>
                                <td class="align-middle">
                                    <c:if test="${not empty item.product.image}"><img class="product-image mr-3" src="<c:out value='${item.product.image}'/>" alt=""></c:if>
                                    <c:out value="${item.product.name}"/>
                                </td>
                                <td class="align-middle"><c:out value="${item.product.price}"/></td>
                                <td class="align-middle text-right">
                                    <form action="/cart/remove" method="post" class="m-0">
                                        <input type="hidden" name="id" value="${item.product.id}">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                        <button class="btn btn-outline-danger btn-sm" type="submit">Remove</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="text-right total">Total: <c:out value="${total}"/></div>
            </c:otherwise>
        </c:choose>
    </div>
</main>
</body>
</html>
