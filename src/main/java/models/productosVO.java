package models;

public class productosVO {
	int idProductos;
	String nombre;
	String descripcion;
	float precio;
	String imagenString;
	int Marcas_idMarcas;
	int Categorias_idCategorias;
	boolean destacado;
	int cantidad;
	
	
	public productosVO(int idProductos, String nombre, String descripcion, float precio, String imagenString,
			int marcas_idMarcas, int categorias_idCategorias, boolean destacado, int cantidad) {
		super();
		this.idProductos = idProductos;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precio = precio;
		this.imagenString = imagenString;
		Marcas_idMarcas = marcas_idMarcas;
		Categorias_idCategorias = categorias_idCategorias;
		this.destacado = destacado;
		this.cantidad = cantidad;
	}
	public int getCantidad() {
		return cantidad;
	}
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	public int getIdProductos() {
		return idProductos;
	}
	public void setIdProductos(int idProductos) {
		this.idProductos = idProductos;
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
	public float getPrecio() {
		return precio;
	}
	public void setPrecio(float precio) {
		this.precio = precio;
	}
	public String getImagenString() {
		return imagenString;
	}
	public void setImagenString(String imagenString) {
		this.imagenString = imagenString;
	}
	public int getMarcas_idMarcas() {
		return Marcas_idMarcas;
	}
	public void setMarcas_idMarcas(int marcas_idMarcas) {
		Marcas_idMarcas = marcas_idMarcas;
	}
	public int getCategorias_idCategorias() {
		return Categorias_idCategorias;
	}
	public void setCategorias_idCategorias(int categorias_idCategorias) {
		Categorias_idCategorias = categorias_idCategorias;
	}
	public boolean isDestacado() {
		return destacado;
	}
	public void setDestacado(boolean destacado) {
		this.destacado = destacado;
	}
	
	public productosVO(int idProductos, String nombre, String descripcion, float precio, String imagenString,
			int marcas_idMarcas, int categorias_idCategorias, boolean destacado) {
		super();
		this.idProductos = idProductos;
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precio = precio;
		this.imagenString = imagenString;
		Marcas_idMarcas = marcas_idMarcas;
		Categorias_idCategorias = categorias_idCategorias;
		this.destacado = destacado;
	}
	
	@Override
	public String toString() {
		return "productosVO [idProductos=" + idProductos + ", nombre=" + nombre + ", descripcion=" + descripcion
				+ ", precio=" + precio + ", imagenString=" + imagenString + ", Marcas_idMarcas=" + Marcas_idMarcas
				+ ", Categorias_idCategorias=" + Categorias_idCategorias + ", destacado=" + destacado + "]";
	}
	
	
	
}
