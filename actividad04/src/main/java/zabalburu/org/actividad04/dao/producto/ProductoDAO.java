package zabalburu.org.actividad04.dao.producto;

import java.util.List;

import zabalburu.org.actividad04.modelo.LineaPedido;
import zabalburu.org.actividad04.modelo.Producto;
import zabalburu.org.actividad04.modelo.Usuario;

public interface ProductoDAO {
	Producto getProductoId(Integer id);
	Producto nuevoProducto(Producto nueva);
	Producto modificarProducto(Producto modificada);
	void eliminarProducto(Integer id);
	List<Producto> getProducto();
	List<Producto> getProductoCat(Integer id);
	List<Producto> getNivelStock();
}
