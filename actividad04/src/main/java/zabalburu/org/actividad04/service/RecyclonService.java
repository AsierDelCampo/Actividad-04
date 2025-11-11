package zabalburu.org.actividad04.service;

import java.util.List;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import zabalburu.org.actividad04.dao.producto.ProductoDAO;
import zabalburu.org.actividad04.dao.usuario.UsuarioDAO;
import zabalburu.org.actividad04.modelo.Producto;
import zabalburu.org.actividad04.modelo.Usuario;

@ApplicationScoped // Indica que solo habrá una única instancia del bean durante toda la vida de la aplicación
public class RecyclonService {

	@Inject
	private UsuarioDAO usuarioDAO;
	
	public Usuario login(String nombre, String contra) {
		return usuarioDAO.login(nombre, contra);
	}
	
	public Usuario getUsuario(Integer id) {
		return usuarioDAO.getUsuario(id);
	}
	
	
	@Inject
	private ProductoDAO productoDAO;
	
	public Producto nuevoProducto(Producto nueva) {
		return productoDAO.nuevoProducto(nueva);
	}
	
	public Producto modificarProducto(Producto modificada) {
		return productoDAO.modificarProducto(modificada);
	}
	
	public void eliminarProducto(Integer id) {
		productoDAO.eliminarProducto(id);
	}
	
	public List<Producto> getProducto(){
		return productoDAO.getProducto();
	}
	
	public List<Producto> getProductoCat(Integer id){
		return productoDAO.getProductoCat(id);
	}
	
}
