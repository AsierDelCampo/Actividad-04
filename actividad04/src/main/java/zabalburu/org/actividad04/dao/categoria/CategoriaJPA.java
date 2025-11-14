package zabalburu.org.actividad04.dao.categoria;

import java.util.List;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;
import zabalburu.org.actividad04.modelo.Categoria;


@ApplicationScoped
@Transactional
public class CategoriaJPA implements CategoriaDAO{

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Categoria> getListaCategorias() {
		Query q = em.createQuery(
				"""
				   Select c
				   From Categoria c
				   Order By c.id
				"""
				);
		
		return q.getResultList();
	}

	@Override
	public Categoria getCategoria(Integer id) {
		Categoria c = em.find(Categoria.class, id);
		Query q = em.createQuery(
		"""
			Select c
			From Categoria c JOIN FETCH c.productos
			Where c.id = :idCategoria
		""");
	
		q.setParameter("idCategoria", id);
		
		try {
			c = (Categoria) q.getSingleResult();
		} catch (NoResultException ex) {
			c = null;
		}
		return c;
	}

}
