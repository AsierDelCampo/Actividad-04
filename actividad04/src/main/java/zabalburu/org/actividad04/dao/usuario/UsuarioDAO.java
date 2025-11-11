package zabalburu.org.actividad04.dao.usuario;

import zabalburu.org.actividad04.modelo.Usuario;

public interface UsuarioDAO {
	Usuario login(String nombre, String password);
	Usuario getUsuario(Integer id);
}
