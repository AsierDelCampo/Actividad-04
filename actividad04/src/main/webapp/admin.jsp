<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<title>Admin</title>

<style>
    body { background: #f5f6fa; font-family: 'Segoe UI'; }
    .card-custom {
        border-radius: 20px;
        border: none;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }
    .product-thumb {
        width: 55px;
        height: 55px;
        border-radius: 10px;
        object-fit: cover;
    }
</style>

</head>

<body>

<nav class="navbar navbar-light bg-white shadow-sm mb-4 p-3">
    <div class="container-fluid">
        <h3 class="fw-bold">Panel de Administración</h3>
        <a href="login" class="btn btn-outline-primary">Volver</a>
    </div>
</nav>

<div class="container">

    <!-- Acordeón -->
    <div class="accordion shadow-sm mb-4" id="adminAccordion">

        <!-- Añadir -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button gap-2" data-bs-toggle="collapse" data-bs-target="#addForm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="green" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
					  <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3z"/>
					</svg> Añadir Producto
                </button>
            </h2>

            <div id="addForm" class="accordion-collapse collapse show">
                <div class="accordion-body">

                    <form action="ControladorRecyclon" method="get" class="row g-3">

                        <div class="col-md-4">
                            <label class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="nombre" required>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Precio</label>
                            <input type="text" class="form-control" name="precio" required>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Categoría</label>
                            <select class="form-select" name="categoria" required>
                                <option>Seleccione...</option>
                                <c:forEach var="c" items="${categorias}">
                                    <option value="${c.id}">${c.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Descripción</label>
                            <input type="text" class="form-control" name="descripcion" required>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label">Stock</label>
                            <input type="text" class="form-control" name="stock" required>
                        </div>
                        
                        <div class="col-12 text-center">
                            <button type="submit" class="btn btn-success" name="accion" value="nuevo">
                                Añadir Producto
                            </button>
                        </div>

                    </form>

                </div>
            </div>
        </div>

        <!-- Modificar -->
      
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed gap-2" data-bs-toggle="collapse" data-bs-target="#editForm">
					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="blue" class="bi bi-pencil-fill" viewBox="0 0 16 16">
					  <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
					</svg> Modificar Producto
                </button>
            </h2>

            <div id="editForm" class="accordion-collapse collapse">
                <div class="accordion-body">

                    <form action="ControladorRecyclon" method="get" class="row g-3">

                        <div class="col-md-4">
                            <label class="form-label">ID</label>
                            <select class="form-select" name="id" required>
                                <option>Seleccione...</option>
                                <c:forEach var="p" items="${productos}">
                                    <option value="${p.id}">${p.id}, ${p.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Nombre</label>
                            <input type="text" class="form-control" name="nombre" value="${p.nombre}" required>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Precio</label>
                            <input type="text" class="form-control" name="precio" required>
                        </div>

                        <div class="col-md-4">
                            <label class="form-label">Categoría</label>
                            <select class="form-select" name="categoria" required>
                                <option>Seleccione...</option>
                                <c:forEach var="c" items="${categorias}">
                                    <option value="${c.id}">${c.nombre}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">Descripción</label>
                            <input type="text" class="form-control" name="descripcion" required>
                        </div>

                        <div class="col-md-3">
                            <label class="form-label">Stock</label>
                            <input type="text" class="form-control" name="stock" required>
                        </div>


                        <div class="col-12 text-center">
                            <button type="submit" class="btn btn-primary" name="accion" value="modificar">
                                Guardar Cambios
                            </button>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>
	<div class="card card-custom p-4 mb-4">
		<h4 class="text-primary mb-3">Stock Bajo <span class="badge bg-secondary">Stock inferior a 10</span> </h4>
             
    <c:if test="${empty stockbajo}">
        <div class="alert alert-info text-center">No hay productos con stock bajo</div>
    </c:if>

    <c:if test="${!empty stockbajo}">
        <div class="table-responsive">
            <table class="table table-hover">
                <thead class="table-light">
                    <tr>
                        <th>#</th>
                        <th>Nombre</th>
                        <th>Descripción</th>
                        <th>Categoria</th>
                        <th>Precio</th>
                        <th>Stock</th>
                        <th></th><th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${stockbajo}">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.nombre}</td>
                        <td>${p.descripcion}</td>
                        <td>${p.categoria.nombre}</td>
                        <td>
                            <fmt:formatNumber value="${p.precioUnitario}" type="currency" currencySymbol="€"/>
                        </td>
                        <td>${p.stock}</td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
	</div>

    <!-- Catálogo -->
    <div class="card card-custom p-4">
        <h4 class="text-primary mb-3">Catálogo</h4>

        <c:if test="${empty productos}">
            <div class="alert alert-info text-center">No hay productos</div>
        </c:if>

        <c:if test="${!empty productos}">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead class="table-light">
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Categoria</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th></th><th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${productos}">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.nombre}</td>
                            <td>${p.descripcion}</td>
                            <td>${p.categoria.nombre}</td>
                            <td>
                                <fmt:formatNumber value="${p.precioUnitario}" type="currency" currencySymbol="€"/>
                            </td>
                            <td>${p.stock}</td>

                            <td><a href="ControladorRecyclon?accion=eliminar&id=${p.id}" class="btn btn-sm btn-danger">Borrar</a></td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>

    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
