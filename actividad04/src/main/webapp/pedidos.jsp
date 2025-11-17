<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Cliente</title>

<style>
    body { background: #f5f6fa; font-family: 'Segoe UI', sans-serif; }
    .card-product {
        border: none;
        border-radius: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        transition: 0.3s;
    }
    .card-product:hover { transform: scale(1.02); }
    .product-img {
        border-radius: 20px 20px 0 0;
        height: 200px;
        object-fit: cover;
        width: 100%;
    }
</style>

</head>

<body>

    <nav class="navbar navbar-light bg-white shadow-sm mb-4 p-3">
        <div class="container-fluid">
            <h3 class="fw-bold">Hola, ${usuario.nombre } ${usuario.apellidos}</h3>
            <a href="login" class="btn btn-outline-primary">Volver</a>
        </div>
    </nav>

    <div class="container">

        <!-- Categorías -->
        <div class="card shadow-sm p-4 mb-4">
            <h4 class="mb-3 text-primary">Categorías</h4>

            <form action="ControladorRecyclon" method="get">
                <input type="hidden" name="accion" value="filtrar">
                <select class="form-select" name="cat" id="cat" onchange="this.form.submit()">
                    <option value="">Seleccione...</option>
                    <c:forEach var="c" items="${categorias}">
                        <option value="${c.id}"
                          <c:if test="${param.cat == c.id}">selected="selected"</c:if>>
                          ${c.nombre}
                        </option>
                    </c:forEach>
                </select>
            </form>
        </div>

        <!-- Catálogo -->
        <c:if test="${not empty productoscat}">
        <h4 class="text-primary mb-3">Catálogo</h4>

        <c:if test="${empty productos}">
            <div class="alert alert-info text-center">No hay productos</div>
        </c:if>

        <div class="row g-4">
        <c:forEach var="p" items="${productoscat}">
            <div class="col-md-4">
                <div class="card card-product">

<%--                     <img src="<c:out value='${p.foto}'/>" --%>
<!--                          onerror="this.src='https://via.placeholder.com/300x200?text=Sin+Foto'" -->
<!--                          class="product-img" alt="img/productos/"> -->

                    <div class="card-body">
                        <h5 class="fw-bold">${p.nombre}</h5>
                        <p class="text-muted">${p.descripcion}</p>
                        <p class="fw-semibold">Categoría: ${p.categoria.nombre}</p>
                        <p class="text-success fw-bold">
                            <fmt:formatNumber value="${p.precioUnitario}" type="currency" currencySymbol="€"/>
                        </p>
                        <a href="ControladorRecyclon?accion=modificar&id=${p.id}" class="btn btn-primary w-100">
                            Comprar
                        </a>
                    </div>

                </div>
            </div>
        </c:forEach>
        </div>
	</c:if>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
