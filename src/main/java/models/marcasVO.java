package models;

public class marcasVO {
	int idMarcas;
	String nombre;
	String descripcion;
	String imagenString;
	public int getIdMarcas() {
		return idMarcas;
	}
	public void setIdMarcas(int idMarcas) {
		this.idMarcas = idMarcas;
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
	public String getImagenString() {
		return imagenString;
	}
	public void setImagenString(String imagenString) {
		this.imagenString = imagenString;
	}
	public marcasVO(int idMarcas, String nombre, String descripcion, String imagenString) {
		super();
		this.idMarcas = idMarcas;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.imagenString = imagenString;
	}
	
	@Override
	public String toString() {
		return "marcasVO [idMarcas=" + idMarcas + ", nombre=" + nombre + ", descripcion=" + descripcion
				+ ", imagenString=" + imagenString + "]";
	}
	
	
}
