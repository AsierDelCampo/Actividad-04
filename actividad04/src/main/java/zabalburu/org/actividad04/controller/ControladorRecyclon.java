package zabalburu.org.actividad04.controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import zabalburu.org.actividad04.cdi.MensajeCDI;
import zabalburu.org.actividad04.modelo.Categoria;
import zabalburu.org.actividad04.modelo.Producto;
import zabalburu.org.actividad04.modelo.Usuario;
import zabalburu.org.actividad04.service.RecyclonService;

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
		String accion = request.getParameter("accion");
		HttpSession sesion = request.getSession(false);
		Usuario usuario = null;
	        if (sesion == null || sesion.getAttribute("usuario") == null) {
	            response.sendRedirect("login");
	            return;
	        }
	        if (sesion != null) {
	            usuario = (Usuario) sesion.getAttribute("usuario");
	        }

	        
	        switch (accion.toLowerCase()) {
			
			case "eliminar":
				pagina = eliminarProducto(request,response);
				break;
			case "modificar":
				pagina = modificarProducto(request,response);
				break;
			case "nuevo":
				pagina = nuevoProducto(request,response);
				break;
	        }
	        
	        //Lista Productos
	        List<Producto> productos = service.getProducto();
	        request.setAttribute("productos", productos);
	        
	        //Lista Categoría
	        List<Categoria> categorias = service.getListaCategorias();
	        request.setAttribute("categorias", categorias);
	        
	        if (usuario.getAdmin() == true) {
	        	pagina="admin.jsp";
	        }else {
	        	pagina="cliente.jsp";
	        }
	        
	        
	        request.getRequestDispatcher(pagina).forward(request, response);

	}

	private String nuevoProducto(HttpServletRequest request, HttpServletResponse response) {

		Producto p = new Producto();
		Categoria c = (Categoria) request.getAttribute("categoria");
		Integer idCategoria = c.getId();
		c = service.getCategoria(idCategoria);
		
		Double precio = 0.0;
		String precioStr = request.getParameter("precio");

		if (precioStr != null && !precioStr.trim().isEmpty()) {
		    try {
		        precio = Double.parseDouble(precioStr.trim());
		    } catch (NumberFormatException e) {
		        e.printStackTrace();
		        // manejar error, dejar precio = 0.0 o mostrar mensaje
		    }
		} else {
		    // manejar el caso donde no se envió el precio
		    System.out.println("Precio no recibido desde el formulario.");
		}
		
		p.setNombre(request.getParameter("nombre"));
		p.setPrecioUnitario(precio);
		p.setCategoria(c);
		p.setDescripcion(request.getParameter("descripcion"));
		//p.setStock(Integer.parseInt(request.getParameter("stock")));
		
		service.nuevoProducto(p);
		
		return "ControladorRecyclon";
	}

	private String modificarProducto(HttpServletRequest request, HttpServletResponse response) {
		/*try {
            Integer id = Integer.parseInt(request.getParameter("id"));
            service.modificarProducto(producto);
        } catch (Exception e) {
            e.printStackTrace(); 
        }*/
		return "ControladorRecyclon";
	}

	private String eliminarProducto(HttpServletRequest request, HttpServletResponse response) {
		try {
            Integer id = Integer.parseInt(request.getParameter("id"));
            service.eliminarProducto(id);
        } catch (Exception e) {
            e.printStackTrace(); 
        }
		return "ControladorRecyclon";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
