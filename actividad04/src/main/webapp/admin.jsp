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
    body { 
        background: #f5f6fa; 
        font-family: 'Segoe UI'; 
    }
    .btn-añadir {
        background: linear-gradient(to right, #28a745, #20c997);
        color: white;
        transition: background 0.3s ease, transform 0.2s ease;
    }
    .btn-añadir:hover {
        background: linear-gradient(to right, #20c997, #28a745);
    }
    .btn-editar {
        background: linear-gradient(to right, #007bff, #339af0);
        color: white;
        transition: background 0.3s ease, transform 0.2s ease;
    }
    .btn-editar:hover {
        background: linear-gradient(to right, #339af0, #007bff);
    }

    .btn-eliminar {
        background: linear-gradient(to right, #dc3545, #e4606d);
        color: white;
        transition: background 0.3s ease, transform 0.2s ease;
    }
    .btn-eliminar:hover {
        background: linear-gradient(to right, #e4606d, #dc3545);
        transform: scale(1.05);
    }
    .table-custom tbody tr:hover {
        background-color: rgba(0, 0, 0, 0.03);
    }
</style>
</head>

<body>

<nav class="navbar navbar-light bg-white shadow-sm mb-4 p-3">
    <div class="container-fluid d-flex align-items-center">
        <img src="imagenes/recyclon.png" alt="Logo" class="me-3" style="height: 50px;">
        <h3 class="fw-bold mb-0 flex-grow-1 text-center">Panel de Administración</h3>
        <a href="login" class="btn btn-outline-primary rounded-3 fw-semibold ms-auto">
            Volver
        </a>
    </div>
</nav>

<div class="container">

   <div class="accordion shadow-sm mb-4" id="adminAccordion">

    <!-- Añadir Producto -->
    <div class="accordion-item border-0 rounded-0">
        <h2 class="accordion-header">
            <button class="accordion-button btn-añadir gap-2 border-0 rounded-1 collapsed" data-bs-toggle="collapse" data-bs-target="#addForm">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="green" class="bi bi-plus-circle-fill" viewBox="0 0 16 16">
                    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3z"/>
                </svg> Añadir Producto
            </button>
        </h2>
        <div id="addForm" class="accordion-collapse collapse">
            <div class="accordion-body">
                <form action="ControladorRecyclon" method="get" class="row g-3">

                    <div class="col-12 col-md-6 col-lg-4">
                        <label class="form-label">Nombre</label>
                        <input type="text" class="form-control" name="nombre" required>
                    </div>

                    <div class="col-12 col-md-6 col-lg-4">
                        <label class="form-label">Precio</label>
                        <input type="text" class="form-control" name="precio" required>
                    </div>

                    <div class="col-12 col-md-12 col-lg-4">
                        <label class="form-label">Categoría</label>
                        <select class="form-select" name="categoria" required>
                            <option>Seleccione...</option>
                            <c:forEach var="c" items="${categorias}">
                                <option value="${c.id}">${c.nombre}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-12 col-md-8">
                        <label class="form-label">Descripción</label>
                        <input type="text" class="form-control" name="descripcion" required>
                    </div>

                    <div class="col-12 col-md-4">
                        <label class="form-label">Stock</label>
                        <input type="text" class="form-control" name="stock" required>
                    </div>

                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-añadir btn-lg fw-semibold rounded-3" name="accion" value="nuevo">
                            Añadir Producto
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modificar Producto -->
    <div class="accordion-item border-0 rounded-0">
        <h2 class="accordion-header">
            <button class="accordion-button btn-editar gap-2 border-0 rounded-1 collapsed" data-bs-toggle="collapse" data-bs-target="#editForm">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="blue" class="bi bi-pencil-fill" viewBox="0 0 16 16">
                    <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
                </svg> Modificar Producto
            </button>
        </h2>
        <div id="editForm" class="accordion-collapse collapse">
            <div class="accordion-body">
                <form action="ControladorRecyclon" method="get" class="row g-3">

                    <div class="col-12 col-md-4">
                        <label class="form-label">ID</label>
                        <select class="form-select" name="id" required>
                            <option>Seleccione...</option>
                            <c:forEach var="p" items="${productos}">
                                <option value="${p.id}">${p.id}, ${p.nombre}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-12 col-md-4">
                        <label class="form-label">Nombre</label>
                        <input type="text" class="form-control" name="nombre" required>
                    </div>

                    <div class="col-12 col-md-4">
                        <label class="form-label">Categoría</label>
                        <select class="form-select" name="categoria" required>
                            <option>Seleccione...</option>
                            <c:forEach var="c" items="${categorias}">
                                <option value="${c.id}">${c.nombre}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="col-12 col-md-8">
                        <label class="form-label">Descripción</label>
                        <input type="text" class="form-control" name="descripcion" required>
                    </div>

                    <div class="col-12 col-md-4">
                        <label class="form-label">Stock</label>
                        <input type="text" class="form-control" name="stock" required>
                    </div>

                    <div class="col-12 text-center">
                        <button type="submit" class="btn btn-editar btn-lg fw-semibold rounded-3" name="accion" value="modificar">
                            Guardar Cambios
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


    <!-- Stock Bajo -->
    <div class="card shadow-sm rounded-4 p-4 mb-4">
        <h4 class="text-primary mb-3">Stock Bajo <span class="badge bg-warning bg-opacity-75">Stock inferiores a 10</span></h4>
        <c:if test="${empty stockbajo}">
            <div class="alert alert-info text-center">No hay productos con stock bajo</div>
        </c:if>
        <c:if test="${!empty stockbajo}">
            <div class="table-responsive rounded-4 overflow-hidden">
                <table class="table table-hover table-light align-middle table-custom">
                    <thead class="table-light text-center fw-semibold">
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Categoria</th>
                            <th>Precio</th>
                            <th>Stock</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${stockbajo}">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.nombre}</td>
                            <td>${p.descripcion}</td>
                            <td>${p.categoria.nombre}</td>
                            <td><fmt:formatNumber value="${p.precioUnitario}" type="currency" currencySymbol="€"/></td>
                            <td>${p.stock}</td>
                        </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </div>

    <!-- Catálogo -->
    <div class="card shadow-sm rounded-4 p-4">
        <h4 class="text-primary mb-3">Catálogo</h4>
        <c:if test="${empty productos}">
            <div class="alert alert-info text-center">No hay productos</div>
        </c:if>
        <c:if test="${!empty productos}">
            <div class="table-responsive rounded-4 overflow-hidden">
                <table class="table table-hover table-light align-middle rounded-4 table-custom">
                    <thead class="table-light text-center fw-semibold">
                        <tr>
                            <th>#</th>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Categoria</th>
                            <th>Precio</th>
                            <th>Stock</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="p" items="${productos}">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.nombre}</td>
                            <td>${p.descripcion}</td>
                            <td>${p.categoria.nombre}</td>
                            <td><fmt:formatNumber value="${p.precioUnitario}" type="currency" currencySymbol="€"/></td>
                            <td>${p.stock}</td>
                            <td>
                                <a href="ControladorRecyclon?accion=eliminar&id=${p.id}" class="btn btn-eliminar btn-sm fw-semibold rounded-3 d-flex align-items-center gap-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                                      <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                                    </svg>Borrar
                                </a>
                            </td>
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
