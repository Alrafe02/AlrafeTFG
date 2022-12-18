package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import utils.ConexionBD;

public class productosDAO {

	public static ArrayList<productosVO> listaProductos(){
		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Productos";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				productosVO producto = new productosVO(
						rs.getInt("idProductos"),
						rs.getString("nombre"),
						rs.getString("descripcion"),
						rs.getFloat("precio"),
						rs.getString("imagenString"),
						rs.getInt("Marcas_idMarcas"),
						rs.getInt("Categorias_idCategorias"),
						rs.getBoolean("destacado")
						);
				productos.add(producto);
			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return productos;
	}
	public static ArrayList<productosVO> listaProductosDestacados(){
		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Productos WHERE destacado = true";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				productosVO producto = new productosVO(
						rs.getInt("idProductos"),
						rs.getString("nombre"),
						rs.getString("descripcion"),
						rs.getFloat("precio"),
						rs.getString("imagenString"),
						rs.getInt("Marcas_idMarcas"),
						rs.getInt("Categorias_idCategorias"),
						rs.getBoolean("destacado")
						);
				productos.add(producto);
			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return productos;
	}
	public static ArrayList<productosVO> listaProductosPorCategoria(int categoria){
		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Productos WHERE Categorias_idCategorias = "+categoria+"";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				productosVO producto = new productosVO(
						rs.getInt("idProductos"),
						rs.getString("nombre"),
						rs.getString("descripcion"),
						rs.getFloat("precio"),
						rs.getString("imagenString"),
						rs.getInt("Marcas_idMarcas"),
						rs.getInt("Categorias_idCategorias"),
						rs.getBoolean("destacado")
						);
				productos.add(producto);
			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return productos;
	}
	public static ArrayList<productosVO> listaProductosPorMarca(int marca){
		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Productos WHERE Marcas_idMarcas = "+marca+"";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				productosVO producto = new productosVO(
						rs.getInt("idProductos"),
						rs.getString("nombre"),
						rs.getString("descripcion"),
						rs.getFloat("precio"),
						rs.getString("imagenString"),
						rs.getInt("Marcas_idMarcas"),
						rs.getInt("Categorias_idCategorias"),
						rs.getBoolean("destacado")
						);
				productos.add(producto);
			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return productos;
	}
	public static ArrayList<productosVO> listaProductosPorNombre(String nombre){
		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Productos WHERE nombre LIKE \"%"+nombre+"%\"";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				productosVO producto = new productosVO(
						rs.getInt("idProductos"),
						rs.getString("nombre"),
						rs.getString("descripcion"),
						rs.getFloat("precio"),
						rs.getString("imagenString"),
						rs.getInt("Marcas_idMarcas"),
						rs.getInt("Categorias_idCategorias"),
						rs.getBoolean("destacado")
						);
				productos.add(producto);
			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return productos;
	}
	public static productosVO buscarProductoPorId(String id){
		productosVO producto = null;
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Productos WHERE idProductos = \""+id+"\"";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				producto = new productosVO(
						rs.getInt("idProductos"),
						rs.getString("nombre"),
						rs.getString("descripcion"),
						rs.getFloat("precio"),
						rs.getString("imagenString"),
						rs.getInt("Marcas_idMarcas"),
						rs.getInt("Categorias_idCategorias"),
						rs.getBoolean("destacado")
						);

			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return producto;
	}
	
	public static void addProducto(String nombre,	String descripcion,	float precio, String imagenString, int Marcas_idMarcas,	int Categorias_idCategorias, boolean destacado) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = ""
					+ "INSERT INTO Productos(nombre, descripcion, precio, imagenString, Marcas_idMarcas, Categorias_idCategorias, destacado) VALUES (\""+nombre+"\",\""+descripcion+"\","+precio+",\""+imagenString+"\","+Marcas_idMarcas+","+Categorias_idCategorias+","+destacado+");";
			stat.execute(query);

		stat.close();
		con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void deleteProducto(String idProductos) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = " DELETE FROM Productos WHERE idProductos = "+idProductos+"";
			stat.execute(query);

		stat.close();
		con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static void editProductos(int idProductos,	String nombre,	String descripcion,	float precio, String imagenString, int Marcas_idMarcas,	int Categorias_idCategorias, boolean destacado) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = "UPDATE Productos SET nombre=\""+nombre+"\",descripcion=\""+descripcion+"\",precio="+precio+",imagenString=\""+imagenString+"\",Marcas_idMarcas="+Marcas_idMarcas+",Categorias_idCategorias="+Categorias_idCategorias+",destacado="+destacado+" WHERE idProductos = "+idProductos+";";
			System.out.println(query);
			stat.executeUpdate(query);

		stat.close();
		con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
