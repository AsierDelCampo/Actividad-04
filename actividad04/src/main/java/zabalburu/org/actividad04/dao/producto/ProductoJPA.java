package zabalburu.org.actividad04.dao.producto;

import java.util.List;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import zabalburu.org.actividad04.modelo.Producto;
import zabalburu.org.actividad04.modelo.Usuario;

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
				   From Producto p
				   Where p.categoria.id = :idCat
				   Order By p.id
				"""
				);
		
		q.setParameter("idCat", id);
		return q.getResultList();
				
	}

	@Override
	public Producto getProductoId(Integer id) {
		Producto p = null;
		try {
			Query q = em.createQuery(
				"""
					Select p
					From Producto p LEFT JOIN FETCH p.categoria
					Where p.id = :idProducto
				""");
			
				q.setParameter("idProducto", id);
				p = (Producto) q.getSingleResult();
		} catch (NoResultException ex) {
			
		}
		return p;
	}
	
}
