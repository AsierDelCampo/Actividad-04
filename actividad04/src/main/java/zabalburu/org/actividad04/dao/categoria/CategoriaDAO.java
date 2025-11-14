package zabalburu.org.actividad04.dao.categoria;

import java.util.List;

import zabalburu.org.actividad04.modelo.Categoria;

public interface CategoriaDAO {
	List<Categoria> getListaCategorias();
	Categoria getCategoria(Integer id);
}
