package zabalburu.org.actividad04.service;

import java.util.List;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import zabalburu.org.actividad04.dao.categoria.CategoriaDAO;
import zabalburu.org.actividad04.dao.lineaPedido.LineaPedidoDAO;
import zabalburu.org.actividad04.dao.producto.ProductoDAO;
import zabalburu.org.actividad04.dao.usuario.UsuarioDAO;
import zabalburu.org.actividad04.modelo.Categoria;
import zabalburu.org.actividad04.modelo.LineaPedido;
import zabalburu.org.actividad04.modelo.Pedido;
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
	
	public Producto getProductoId(Integer id) {
		return productoDAO.getProductoId(id);
	}
	
	
	
	@Inject
	private LineaPedidoDAO lineaPedidoDAO;
	
	
	public Pedido nuevoPedido(Pedido nuevo) {
		return lineaPedidoDAO.nuevoPedido(nuevo);
	}
	void eliminarPedido(Integer id){
		lineaPedidoDAO.eliminarPedido(id);
	}
	public Pedido modificarPedido(Pedido modificar) {
		return lineaPedidoDAO.modificarPedido(modificar);
	}
	public List<Pedido> getPedidos(){
		return lineaPedidoDAO.getPedidos();
	}
	
	LineaPedido nuevaLinea(LineaPedido lp) {
		return lineaPedidoDAO.nuevaLinea(lp);
	}
	void eliminarLinea(LineaPedido lp) {
		lineaPedidoDAO.eliminarLinea(lp);
	}
	
	@Inject
	private CategoriaDAO categoriaDAO;
	
	public List<Categoria> getListaCategorias() {
		return categoriaDAO.getListaCategorias();
	}
	public Categoria getCategoria(Integer id) {
		return categoriaDAO.getCategoria(id);
	}

}
