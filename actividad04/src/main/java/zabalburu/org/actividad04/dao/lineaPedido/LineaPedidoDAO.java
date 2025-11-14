package zabalburu.org.actividad04.dao.lineaPedido;

import java.util.List;

import zabalburu.org.actividad04.modelo.LineaPedido;
import zabalburu.org.actividad04.modelo.Pedido;

public interface LineaPedidoDAO {
	Pedido nuevoPedido(Pedido nuevo);
	void eliminarPedido(Integer id);
	Pedido modificarPedido(Pedido modificar);
	List<Pedido> getPedidos();
	LineaPedido nuevaLinea(LineaPedido lp);
	void eliminarLinea(LineaPedido lp);
}
