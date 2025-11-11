package zabalburu.org.actividad04.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import zabalburu.org.actividad04.service.RecyclonService;
import zabalburu.org.actividad04.cdi.MensajeCDI;
import zabalburu.org.actividad04.dao.usuario.UsuarioJPA;


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
		}
		
		request.getRequestDispatcher(pagina).forward(request, response);
	}

	private String login(HttpServletRequest request, HttpServletResponse response) {
		String nombre = request.getParameter("nombre");
		String contra = request.getParameter("contra");
		if (nombre.isBlank() || contra.isBlank()) {
			mensajeCDI.setMessage("Todos los campos sonb OBLIGATORIOS!");
			mensajeCDI.setRole("alert-danger");
			return "index.jsp";
		} 
		if (service.login(nombre, contra) == null) {
			mensajeCDI.setMessage("Usuario / Password ERRÓNEOS");
			mensajeCDI.setRole("alert alert-info");
			return "index.jsp";
		} 
		return "events";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
