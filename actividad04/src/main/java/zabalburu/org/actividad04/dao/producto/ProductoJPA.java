package zabalburu.org.actividad04.dao.producto;

import java.util.List;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import zabalburu.org.actividad04.modelo.Producto;

@ApplicationScoped
@Transactional
public class ProductoJPA implements ProductoDAO{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Producto nuevoProducto(Producto nueva) {
			em.persist(nueva);
			nueva.getCategoria().getProductos().add(nueva);
			return nueva;
	}

	@Override
	public Producto modificarProducto(Producto modificada) {
		return em.merge(modificada);
	}

	@Override
	public void eliminarProducto(Integer id) {
		 Producto eliminar = em.find(Producto.class, id);
		    if (eliminar != null) {
		        em.remove(eliminar);
		    }
	}

	@Override
	public List<Producto> getProducto() {
		Query q = em.createQuery(
				"""
				   Select p
				   From Producto p
				   Order By p.id
				"""
				);
				return q.getResultList();
	}
	
	@Override
	public List<Producto> getProductoCat(Integer id) {
		Query q = em.createQuery(
				"""
				   Select p
				   From Productos p
				   Order By p.id
				   Where p.id = :id
				"""
				);
		
		q.setParameter("id", id);
		return q.getResultList();
				
	}
	
}
