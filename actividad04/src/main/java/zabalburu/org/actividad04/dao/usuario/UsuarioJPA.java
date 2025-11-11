package zabalburu.org.actividad04.dao.usuario;

import zabalburu.org.actividad04.modelo.Usuario;

import java.util.List;


import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import jakarta.transaction.Transactional;

@ApplicationScoped
@Transactional

public class UsuarioJPA implements UsuarioDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Usuario login(String nombre, String password) {
		
		TypedQuery<Usuario> q = em.createQuery(
				"SELECT u FROM Usuario u WHERE u.nombre = :nombre", Usuario.class);
		q.setParameter("nombre", nombre);
		
		Usuario u = q.getSingleResult();
		
		if (u != null) {
			if(u.getContra().equals(password)) {
				return u;
			}
		}
		return null;
	}

	@Override
	public Usuario getUsuario(Integer id) {
		Usuario u = em.find(Usuario.class, id);
		Query q = em.createQuery(
		"""
			Select u
			From Usuario u JOIN FETCH u.pedidos
			Where u.id = :idUsuario	
		""");
	
		q.setParameter("idUsuario", id);
		
		try {
			u = (Usuario) q.getSingleResult();
		} catch (NoResultException ex) {
			u = null;
		}
		return u;
	}

}
