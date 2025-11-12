package zabalburu.org.actividad04.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import zabalburu.org.actividad04.modelo.Pedido;

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
@Table(name ="usuarios")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Usuario implements Serializable {/**
	 * 
	 */
	private static final long serialVersionUID = -7874616688463826542L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@EqualsAndHashCode.Include
	private Integer id;
	
	@Column(
			  name = "nombre_usuario",
			  columnDefinition = "varchar(100)"
			)
			private String nombre;
			
			private String apellidos;
			
			private String contra;
			
			private Boolean admin;
			
			@OneToMany(mappedBy = "usuario")
			@OrderBy("fechaPedido desc")
			private List<Pedido> pedidos;
			
			
	
}
