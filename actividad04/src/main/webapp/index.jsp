<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!doctype html>
<html lang="es">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
      rel="stylesheet">

<title>Identifíquese</title>

<style>
    body {
        background-color: #f5f7fb;
        font-family: "Segoe UI", sans-serif;
    }

    .login-container {
        background: white;
        padding: 35px;
        margin-top: 70px;
        border-radius: 15px;
        box-shadow: 0 3px 12px rgba(0,0,0,0.10);
    }

    h1 {
        font-size: 1.8rem;
        font-weight: 700;
        color: #2b2f38;
    }

    .btn-primary {
        background-color: #0d6efd;
        border-radius: 8px;
        padding: 10px 18px;
        font-size: 1rem;
    }

    label {
        font-weight: 600;
        color: #3b3f47;
    }

    .alert {
        border-radius: 10px;
    }

    .logo {
        width: 70%;
        max-width: 280px;
    }
</style>

</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="col-md-5 login-container">

        <div class="text-center mb-4">
            <img src="imagenes/recyclon.png" 
                 alt="Recylon Logo" class="logo mb-4">
            <h1>Identifíquese</h1>
        </div>

        <c:if test="${! empty mensajeCDI.message }">
            <div class="alert ${mensajeCDI.role } text-center">
                ${mensajeCDI.message}
            </div>
        </c:if>

        <form action="" method="post">

            <div class="mb-3">
                <label for="exampleInputlogin" class="form-label">Nombre</label>
                <input type="text" class="form-control"
                       id="exampleInputlogin" name="nombre"
                       value="${param.nombre}">
            </div>

            <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Contraseña</label>
                <input type="password" class="form-control"
                       id="exampleInputPassword1" name="contra"
                       value="${param.contra}">
            </div>

            <button type="submit" class="btn btn-primary w-100"
                    name="accion" value="login">
                Entrar
            </button>

        </form>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
