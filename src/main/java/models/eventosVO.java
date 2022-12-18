package models;

public class eventosVO {
	int idEvento;
	String nombre;
	String descripcion;
	String horaInicio;
	String horaFinal;
	String fecha;
	String categoria;
	String image;
	
	
	
	public int getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(int idEvento) {
		this.idEvento = idEvento;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getHoraInicio() {
		return horaInicio;
	}
	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}
	public String getHoraFinal() {
		return horaFinal;
	}
	public void setHoraFinal(String horaFinal) {
		this.horaFinal = horaFinal;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public eventosVO(int idEvento, String nombre, String descripcion, String horaInicio, String horaFinal, String fecha,
			String categoria, String image) {
		super();
		this.idEvento = idEvento;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.horaInicio = horaInicio;
		this.horaFinal = horaFinal;
		this.fecha = fecha;
		this.categoria = categoria;
		this.image = image;
	}
	@Override
	public String toString() {
		return "eventosVO [idEvento=" + idEvento + ", nombre=" + nombre + ", descripcion=" + descripcion
				+ ", horaInicio=" + horaInicio + ", horaFinal=" + horaFinal + ", fecha=" + fecha + ", categoria="
				+ categoria + ", image=" + image + "]";
	}
	
	
	
	
}
