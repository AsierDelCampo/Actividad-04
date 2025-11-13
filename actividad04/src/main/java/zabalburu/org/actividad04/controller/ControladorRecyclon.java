package zabalburu.org.actividad04.controller;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zabalburu.org.actividad04.cdi.MensajeCDI;
import zabalburu.org.actividad04.modelo.Producto;
import zabalburu.org.actividad04.modelo.Usuario;
import zabalburu.org.actividad04.service.RecyclonService;

import java.io.IOException;
import java.util.List;


/**
 * Servlet implementation class ControladorRecyclon
 */
@WebServlet("/ControladorRecyclon")
public class ControladorRecyclon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Inject
	private RecyclonService service;
	
	@Inject
	private MensajeCDI mensajeCDI;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorRecyclon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pagina = null; 
		HttpSession sesion = request.getSession(false);
		 Usuario usuario = null;

	        if (sesion == null || sesion.getAttribute("usuario") == null) {
	            response.sendRedirect("login");
	            return;
	        }
	        
	        if (sesion != null) {
	            usuario = (Usuario) sesion.getAttribute("usuario");
	        }
	        
	        if (usuario.getAdmin() == true) {
	        	pagina="admin.jsp";
	        }else {
	        	pagina="cliente.jsp";
	        }
	        
	        request.getRequestDispatcher(pagina).forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
