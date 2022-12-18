package models;

public class categoriasVO {
	int idCategorias;
	String nombre;
	String descripcion;
	public int getIdCategorias() {
		return idCategorias;
	}
	public void setIdCategorias(int idCategorias) {
		this.idCategorias = idCategorias;
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
	public categoriasVO(int idCategorias, String nombre, String descripcion) {
		super();
		this.idCategorias = idCategorias;
		this.nombre = nombre;
		this.descripcion = descripcion;
	}
	@Override
	public String toString() {
		return "categoriasVO [idCategorias=" + idCategorias + ", nombre=" + nombre + ", descripcion=" + descripcion
				+ "]";
	}
	
	
	
	
}
