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
<title>Cliente</title>
</head>
<body>

	<div class="row text-center">
		<h2>Cliente : ${u.nombre }, ${u.apellidos}  <a href="login" class="btn btn-info">Volver</a></h2>
	</div>
	<c:if test="${! empty mensajeCDI }">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<div class="${mensajeCDI.role }">${mensajeCDI.message }</div>
			</div>
		</div>
		</c:if>
			<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<h4>Categorías</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<form action="citas">
				  <div class="mb-3">
				    <select class="form-select" aria-label="Seleccionar categoria" name="cat">
					  <c:forEach var="p" items="${categorias }">
					  	<option value="${p.id }">${p.apellidos }, ${p.nombre }</option>
					  </c:forEach>
					</select>
				  </div>
				</form>
			</div>
		</div>
	
	<div class="row d-flex justify-content-center">
			<div class="col-3"></div>
			<div class="col-6">
				<h4>Catálogo</h4>
			</div>
		</div>
		
		</div>
		<div>
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
								<!-- <th scope="col">Stock</th> -->
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
									<!--  <td>${ p.stock }</td>-->
									<td><a href="ControladorRecyclon?accion=modificar&id=${p.id}">Comprar</a></td>
								
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	 
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
</body>
</html>