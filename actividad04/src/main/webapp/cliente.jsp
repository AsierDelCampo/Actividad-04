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
    body { 
        background: #f5f6fa; 
        font-family: 'Segoe UI', sans-serif; 
    }
    .card-product {
        border-radius: 20px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        border: none;
        transition: transform 0.3s;
    }
    .card-product:hover {
        transform: scale(1.02);
    }
    .product-img {
        border-radius: 20px 20px 0 0;
        height: 200px;
        object-fit: cover;
        width: 100%;
    }
    .btn-comprar {
        background: linear-gradient(to right, #28a745, #20c997);
        color: white;
        font-weight: 600;
        border-radius: 12px;
        transition: background 0.3s ease, transform 0.2s ease;
    }
    .btn-comprar:hover {
        background: linear-gradient(to right, #20c997, #28a745);
        transform: scale(1.05);
    }

    .btn-accordion {
        background: linear-gradient(to right, #007bff, #339af0);
        color: white;
        font-weight: 600;
        border-radius: 12px;
        transition: background 0.3s ease, transform 0.2s ease;
    }
    .btn-accordion:hover {
        background: linear-gradient(to right, #339af0, #007bff);
    }

    .btn-volver {
        font-weight: 600;
        border-radius: 12px;
    }
</style>
</head>
<body>

<nav class="navbar navbar-light bg-white shadow-sm mb-4 p-3">
    <div class="container-fluid d-flex align-items-center justify-content-between">
        <img src="imagenes/recyclon.png" alt="Logo" style="height:50px;">
        <h3 class="fw-bold text-center flex-grow-1">Hola, ${usuario.nombre } ${usuario.apellidos}</h3>
        <a href="login" class="btn btn-outline-primary btn-volver">Volver</a>
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
                    <option value="${c.id}" <c:if test="${param.cat == c.id}">selected</c:if>>
                        ${c.nombre}
                    </option>
                </c:forEach>
            </select>
        </form>
    </div>

	<!-- Lista Pedidos -->
	<div class="accordion mb-3" id="accordionExample">
	    <div class="accordion-item border-0 rounded-0 shadow-sm">
	        <h2 class="accordion-header" id="headingOne">
	            <button class="accordion-button btn-accordion gap-2 border-0 rounded-1 collapsed" type="button" data-bs-toggle="collapse"
	                data-bs-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
	                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-list-task" viewBox="0 0 16 16">
	                    <path fill-rule="evenodd" d="M2 2.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5V3a.5.5 0 0 0-.5-.5zM3 3H2v1h1z"/>
	                    <path d="M5 3.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5M5.5 7a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1zm0 4a.5.5 0 0 0 0 1h9a.5.5 0 0 0 0-1z"/>
	                    <path fill-rule="evenodd" d="M1.5 7a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H2a.5.5 0 0 1-.5-.5zM2 7h1v1H2zm0 3.5a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm1 .5H2v1h1z"/>
	                </svg> Lista Pedidos
	            </button>
	        </h2>
	        <div id="collapse1" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
	            <div class="accordion-body">
				    <div class="table-responsive rounded-4 shadow-sm overflow-hidden">
				        <table class="table table-hover table-light align-middle mb-0 text-center rounded-4">
				            <thead class="table-light">
				                <tr>
				                    <th scope="col">#</th>
				                    <th scope="col">Fecha</th>
				                    <th scope="col">Estado</th>
				                </tr>
				            </thead>
				            <tbody>
				                <c:forEach var="p" items="${usuario.pedidos}">
				                    <tr>
				                        <td>${p.id}</td>
				                        <td><fmt:formatDate value="${p.fechaPedido}"/></td>
				                        <td>${p.estado}</td>
				                    </tr>
				                </c:forEach>
				            </tbody>
				        </table>
				    </div>
				</div>
	        </div>
	    </div>
	</div>


    <!-- Catálogo -->
    <c:if test="${empty productoscat}">
        <div class="alert alert-info text-center">No hay productos de esta categoría</div>
    </c:if>

    <c:if test="${not empty productoscat}">
        <h4 class="text-primary mb-3">Catálogo</h4>
    </c:if>

    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-4">
        <c:forEach var="p" items="${productoscat}">
            <div class="col">
                <div class="card card-product h-100">
                    <!-- <img src="${p.imagen}" alt="${p.nombre}" class="product-img">  -->
                    <div class="card-body d-flex flex-column">
                        <h5 class="fw-bold">${p.nombre}</h5>
                        <p class="text-muted">${p.descripcion}</p>
                        <p class="fw-semibold">Categoría: ${p.categoria.nombre}</p>
                        <p class="text-success fw-bold">
                            <fmt:formatNumber value="${p.precioUnitario}" type="currency" currencySymbol="€"/>
                        </p>
                        <a href="ControladorRecyclon?accion=comprar&id=${p.id}" class="btn btn-comprar mt-auto w-100">
                            Comprar
                        </a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
