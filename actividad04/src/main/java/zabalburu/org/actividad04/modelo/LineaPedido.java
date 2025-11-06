package zabalburu.org.actividad04.modelo;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity
@Table(name= "lineaPedidos")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class LineaPedido implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3461525158417246950L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer Id;
	private Integer cantidad;
	
	@ManyToOne
	@JoinColumn(name ="id_producto")
	private Producto producto;
	
	@ManyToOne
	@JoinColumn(name ="id_pedido")
	private Pedido pedido;
}
