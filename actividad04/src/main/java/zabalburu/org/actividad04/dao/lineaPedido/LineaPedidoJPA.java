package zabalburu.org.actividad04.dao.lineaPedido;

import java.util.List;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import zabalburu.org.actividad04.modelo.LineaPedido;
import zabalburu.org.actividad04.modelo.Pedido;

@ApplicationScoped
@Transactional
public class LineaPedidoJPA implements LineaPedidoDAO {

	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Pedido nuevoPedido(Pedido nuevo) {
		em.persist(nuevo);
		return nuevo;
	}

	@Override
	public void eliminarPedido(Integer id) {
		Pedido eliminar = new Pedido();
		eliminar.setId(id);
		em.remove(eliminar);
	}

	@Override
	public Pedido modificarPedido(Pedido modificar) {
		return em.merge(modificar);
	}

	@Override
	public List<Pedido> getPedidos() {
		Query q = em.createQuery("""
				Select p From Pedido p Order By p.id
				""");
		return q.getResultList();
	}
	
	@Override
	public LineaPedido nuevaLinea(LineaPedido lp) {
		em.persist(lp);
		lp.getPedido().getLineaPedido().add(lp);
		return lp;
	}
	
	@Override
	public void eliminarLinea(LineaPedido lp) {
		em.persist(lp);
		lp.getPedido().getLineaPedido().remove(lp);
	}

}
