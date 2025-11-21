# Actividad-04

Grupo de Asier del Campo e Iraitz Aurrekoetxea

Para desplegar la aplicaión se hará Run on Server en ControladorRecyclon.java.
En el login se puede entrar como un usuario normal o como un administrador, estas son las credenciales:

Usuario Normal: Asier, usuario123
Administrador: Admin, admin123


Modelo E/R

1. Usuarios

Representa a los clientes del sistema.

Campos: id, nombre_usuario, contra, apellidos, admin.

  Relación: un usuario puede tener muchos pedidos.

2. Pedidos

Representa un pedido realizado por un usuario.

Campos: id, fechaPedido, estado, id_cliente.

  Relación:
  
  Cada pedido pertenece a un usuario.
  
  Cada pedido tiene varias lineas de pedido (relación 1:N con lineaPedidos).

3. LineaPedidos

Representa cada producto dentro de un pedido.

Campos: id, cantidad, precioUnitario, id_pedido, id_producto.

Relación:

  Cada línea pertenece a un pedido.
  
  Cada línea referencia un producto.

4. Productos

Información de los artículos vendidos.

Campos: id, nombre, descripcion, precioUnitario, stock, id_categoria.
  
  Relación:
  
  Un producto puede aparecer en muchas líneas de pedido.
  
  Cada producto pertenece a una categoría.

5. Categorias

Clasifica los productos.

Campos: id, nombre_categoria.

  Relación: una categoría puede tener muchos productos.
