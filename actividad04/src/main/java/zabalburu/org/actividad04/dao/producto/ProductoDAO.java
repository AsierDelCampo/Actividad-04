package zabalburu.org.actividad04.dao.producto;

import java.util.List;

import zabalburu.org.actividad04.modelo.Producto;

public interface ProductoDAO {
	Producto nuevoProducto(Producto nueva);
	Producto modificarProducto(Producto modificada);
	void eliminarProducto(Integer id);
	List<Producto> getProducto();
	List<Producto> getProductoCat(Integer id);
}
