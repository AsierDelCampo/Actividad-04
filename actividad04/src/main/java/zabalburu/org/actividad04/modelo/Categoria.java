package zabalburu.org.actividad04.modelo;

import java.io.Serializable;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OrderBy;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity //Clase de Java que mapea una base de datos
@Table(name ="categorias")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Categoria implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 464430176315249784L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@EqualsAndHashCode.Include
	private Integer id;
	
	@Column(
			  name = "nombre_categoria",
			  columnDefinition = "varchar(100)"
			)
	private String nombre;
			
	@OneToMany(mappedBy = "categoria")
	private List<Producto> productos;
	
	@Override
	public String toString() {
		return "Categoria [id=" + id + ", nombre=" + nombre + ", toString()=" + super.toString() + "]";
	}
			
}
