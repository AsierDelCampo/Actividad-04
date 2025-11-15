<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Admin</title>
</head>
<body>
	<div class="container mt-5">
		<div class="row d-flex justify-content-center mb-3">
			<div class="col-3"></div>
			<div class="col-6">
				<h4>Añadir Producto</h4>
			</div>
		</div>
		<div class="border p-3 rounded-3 mb-3">
			<form action="ControladorRecyclon" class="row g-3" method="get">
			  <div class="col-md-4">
			    <label for="validationCustom01" class="form-label">Nombre</label>
			    <input type="text" class="form-control" id="nombre" name="nombre" required>
			  </div>
 			  <div class="col-md-4"> 
 			    <label for="validationCustom02" class="form-label">Precio</label> 
 			    <input type="text" class="form-control" id="precio" name="precio" required> 
			    
 			  </div> 
			  <div class="col-md-4">
			    <label for="validationCustomUsername" class="form-label">Categoría</label>
			    <select class="form-select" id="categoria" name="categoria" required>
			    	<option>Seleccione...</option>
			      <c:forEach var="c" items="${categorias }">
					  	<option value="${c.id }">${c.nombre}</option>
				  </c:forEach>
			    </select>
			  
			  </div>
			  <div class="col-md-6">
			    <label for="validationCustom03" class="form-label">Descripción</label>
			    <input type="text" class="form-control" id="descripcion" name="descripcion" required>
			  </div>
		
			  <div class="col-md-3"> 
 			    <label for="validationCustom05" class="form-label">Stock</label> 
 			    <input type="text" class="form-control" id="stock" name="stock" required> 
 			  </div> 
			  <div class="col-12 d-flex justify-content-center">
			       <button type="submit" class="btn btn-primary" name="accion" value="nuevo">Añadir Producto</button>
			  </div>
			</form>
		</div>
		<div class="row d-flex justify-content-center mb-3">
			<div class="col-3"></div>
			<div class="col-6">
				<h4>Modificar Producto</h4>
			</div>
		</div>
		<div class="border p-3 rounded-3 mb-3">
			<form action="ControladorRecyclon" class="row g-3" method="get">
			  <div class="col-md-4">
			    <label for="validationCustomUsername" class="form-label">ID Producto</label>
			    <select class="form-select" id="id" name="id" required>
			    	<option>Seleccione...</option>
			      <c:forEach var="p" items="${productos }">
					  	<option value="${p.id }">${p.id }, ${p.nombre}</option>
				  </c:forEach>
			    </select>
			  
			  </div>
			  <div class="col-md-4">
			    <label for="validationCustom01" class="form-label">Nombre</label>
			    <input type="text" class="form-control" id="nombre" name="nombre" required>
			  </div>
 			  <div class="col-md-4"> 
 			    <label for="validationCustom02" class="form-label">Precio</label> 
 			    <input type="text" class="form-control" id="precio" name="precio" required> 
			    
 			  </div> 
			  <div class="col-md-4">
			    <label for="validationCustomUsername" class="form-label">Categoría</label>
			    <select class="form-select" id="categoria" name="categoria" required>
			    	<option>Seleccione...</option>
			      <c:forEach var="c" items="${categorias }">
					  	<option value="${c.id }">${c.nombre}</option>
				  </c:forEach>
			    </select>
			  
			  </div>
			  <div class="col-md-6">
			    <label for="validationCustom03" class="form-label">Descripción</label>
			    <input type="text" class="form-control" id="descripcion" name="descripcion" required>
			  </div>
		
			  <div class="col-md-3"> 
 			    <label for="validationCustom05" class="form-label">Stock</label> 
 			    <input type="text" class="form-control" id="stock" name="stock" required> 
 			  </div> 
			  <div class="col-12 d-flex justify-content-center">
			       <button type="submit" class="btn btn-primary" name="accion" value="modificar">Modificar Producto</button>
			  </div>
			</form>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="col-3"></div>
			<div class="col-6">
				<h4>Catálogo</h4>
			</div>
		</div>
		
		</div>
		<c:if test="${empty productos }">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<div class="alert alert-info">No hay productos</div>
				</div>
			</div>
		</c:if>
		<c:if test="${!empty productos }">
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Nombre</th>
								<th scope="col">Descripcion</th>
								<th scope="col">Categoría</th>
								<th scope="col">Precio</th>
								<th scope="col">Stock</th>
								<th></th>								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="p" items="${productos}">
								<tr>
									<th scope="row">${p.id }</th>
									<td>${ p.nombre }</td>
									<td>${ p.descripcion }</td>
									<td>${ p.categoria.nombre }</td>
									<td><fmt:formatNumber value="${p.precioUnitario}" type="currency" currencySymbol="€"/></td>
									<td>${ p.stock }</td>
									<td><a href="ControladorRecyclon?accion=modificar&id=${p.id}">Modificar</a></td>
									<td><a href="ControladorRecyclon?accion=eliminar&id=${p.id}"><svg class="text-danger" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
  <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
</svg></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
	</div>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->

</body>
</html>