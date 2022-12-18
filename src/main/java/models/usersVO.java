package models;

public class usersVO {
	String email;
	String nombre;
	String apellidos;
	String fechaNac;
	String paisNac;
	String passwd;
	String direccion;
	String ciudad;
	int codPostal;
	String foto;
	String genero;
	
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getFechaNac() {
		return fechaNac;
	}
	public void setFechaNac(String fechaNac) {
		this.fechaNac = fechaNac;
	}
	public String getPaisNac() {
		return paisNac;
	}
	public void setPaisNac(String paisNac) {
		this.paisNac = paisNac;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getCiudad() {
		return ciudad;
	}
	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}
	public int getCodPostal() {
		return codPostal;
	}
	public void setCodPostal(int codPostal) {
		this.codPostal = codPostal;
	}
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	public String getGenero() {
		return genero;
	}
	public void setGenero(String genero) {
		this.genero = genero;
	}
	public usersVO(String email, String nombre, String apellidos, String fechaNac, String paisNac, String passwd,
			String direccion, String ciudad, int codPostal, String foto, String genero) {
		super();
		this.email = email;
		this.nombre = nombre;
		this.apellidos = apellidos;
		this.fechaNac = fechaNac;
		this.paisNac = paisNac;
		this.passwd = passwd;
		this.direccion = direccion;
		this.ciudad = ciudad;
		this.codPostal = codPostal;
		this.foto = foto;
		this.genero = genero;
	}
	@Override
	public String toString() {
		return "usersVO [email=" + email + ", nombre=" + nombre + ", apellidos=" + apellidos + ", fechaNac=" + fechaNac
				+ ", paisNac=" + paisNac + ", passwd=" + passwd + ", direccion=" + direccion + ", ciudad=" + ciudad
				+ ", codPostal=" + codPostal + ", foto=" + foto + ", genero=" + genero + "]";
	}
	
	
	
	
	
}
