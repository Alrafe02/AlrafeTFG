package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import utils.ConexionBD;

public class categoriasDAO {

	
	
	public static ArrayList<categoriasVO> listaCategorias(){
		ArrayList<categoriasVO> categorias = new ArrayList<categoriasVO>();
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Categorias";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				categoriasVO categoria = new categoriasVO(
						rs.getInt("idCategorias"),
						rs.getString("nombre"),
						rs.getString("descripcion")

						);
				categorias.add(categoria);
			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return categorias;
	}
	
	

	public static void addCategoria(String nombre, String descripcion) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = ""
					+ "INSERT INTO Categorias(nombre, descripcion) VALUES (\""+nombre+"\",\""+descripcion+"\");";
			stat.execute(query);

		stat.close();
		con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static void deleteCategoria(String idCategorias) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = " DELETE FROM Categorias WHERE idCategorias = "+idCategorias+"";
			stat.execute(query);

		stat.close();
		con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static void editCategoria(String idCategorias, String nombre, String descripcion) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = "UPDATE Categorias SET nombre=\""+nombre+"\",descripcion=\""+descripcion+"\" WHERE idCategorias = "+idCategorias+";";
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
