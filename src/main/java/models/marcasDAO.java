package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import utils.ConexionBD;

public class marcasDAO {

	
	public static ArrayList<marcasVO> listaMarcas(){
		ArrayList<marcasVO> marcas = new ArrayList<marcasVO>();
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Marcas";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				marcasVO marca = new marcasVO(
						rs.getInt("idMarcas"),
						rs.getString("nombre"),
						rs.getString("descripcion"),
						rs.getString("imagenString")
						);
				marcas.add(marca);
			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return marcas;
	}
	public static String buscarMarcaPorId(int idMarca){
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		String nombreMarca = "";
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Marcas WHERE idMarcas = "+idMarca;
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				
						nombreMarca = rs.getString("nombre");

			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return nombreMarca;
	}
	
	public static void addMarca(String nombre, String descripcion, String imagenString) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = ""
					+ "INSERT INTO Marcas(nombre, descripcion, imagenString) VALUES (\""+nombre+"\",\""+descripcion+"\",\""+imagenString+"\");";
			stat.execute(query);

		stat.close();
		con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static void deleteMarca(String idMarcas) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = " DELETE FROM Marcas WHERE idMarcas = "+idMarcas+"";
			stat.execute(query);

		stat.close();
		con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static void editMarca(String idMarcas, String nombre, String descripcion, String imagenString) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = "UPDATE Marcas SET nombre=\""+nombre+"\",descripcion=\""+descripcion+"\",imagenString=\""+imagenString+"\" WHERE idMarcas = "+idMarcas+";";
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
