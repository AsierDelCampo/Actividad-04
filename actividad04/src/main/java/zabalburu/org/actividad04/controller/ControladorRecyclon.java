package zabalburu.org.actividad04.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zabalburu.org.actividad04.service.RecyclonService;
import zabalburu.org.actividad04.cdi.MensajeCDI;
import zabalburu.org.actividad04.dao.usuario.UsuarioJPA;
import zabalburu.org.actividad04.modelo.Producto;
import zabalburu.org.actividad04.modelo.Usuario;


/**
 * Servlet implementation class ControladorRecyclon
 */
@WebServlet("/ControladorRecyclon")
public class ControladorRecyclon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	private final static DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	
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
		String accion = request.getParameter("accion");
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String pagina = "";
		if (accion == null) {
			pagina = "index.jsp";  // login
		} else if (accion.toLowerCase().equals("login")){
			pagina = login(request,response);
		} else if (accion.toLowerCase().equals("admin")) {
			
			switch (accion.toLowerCase()) {
			case "solicitarcatalogoadmin": 
				pagina = solicitarCatalogoAdmin(request,response);
				break;
			
		}
			
		}
		
		request.getRequestDispatcher(pagina).forward(request, response);
	}

	private String login(HttpServletRequest request, HttpServletResponse response) {
		String nombre = request.getParameter("nombre");
		String contra = request.getParameter("contra");
		if (nombre.isBlank() || contra.isBlank()) {
			mensajeCDI.setMessage("Todos los campos son OBLIGATORIOS!");
			mensajeCDI.setRole("alert-danger");
			return "index.jsp";
		} 
		if (service.login(nombre, contra) == null) {
			mensajeCDI.setMessage("Usuario / Password ERRÓNEOS");
			mensajeCDI.setRole("alert alert-info");
			return "index.jsp";
		} 
		
		Usuario log = service.login(nombre, contra);
		
		if (log.getAdmin() == true) {
			return "admin.jsp";
		} else {
			return "cliente.jsp";
		}
	}
	
	private String solicitarCatalogoAdmin(HttpServletRequest request, HttpServletResponse response) {
		HttpSession sesion = request.getSession();
		List<Producto> p = service.getProducto();
		sesion.setAttribute("producto", p);
		return "admin.jsp";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
