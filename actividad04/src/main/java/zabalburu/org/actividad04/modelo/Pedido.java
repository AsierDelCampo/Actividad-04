package zabalburu.org.actividad04.modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import zabalburu.org.actividad04.modelo.Cliente;
import zabalburu.org.actividad04.modelo.LineaPedido;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Entity //Clase de Java que mapea una base de datos
@Table(name ="pedidos")
@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true)
public class Pedido implements Serializable	 {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3245073075663406939L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private Date fechaPedido;
	
	@ManyToOne
	@JoinColumn(name = "id_clientes")
	private Cliente cliente;
	private List<LineaPedido> lineaPedido;
	

}
