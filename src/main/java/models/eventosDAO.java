package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import utils.ConexionBD;
import utils.EncriptadorSHA256;

public class eventosDAO {

	
	
	
	
	public static ArrayList<eventosVO> listaEventos(){
		ArrayList<eventosVO> eventos = new ArrayList<eventosVO>();
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Eventos";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				eventosVO evento = new eventosVO(
						rs.getInt("idEvento"),
						rs.getString("nombre"),
						rs.getString("descripcion"),
						rs.getString("horaInicio"),
						rs.getString("horaFinal"),
						rs.getString("fecha"),
						rs.getString("categoria"),
						rs.getString("image")
						);
				eventos.add(evento);
			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return eventos;
	}
	
	
	
	public static void addEvento(String nombre, String descripcion, String horaInicio, String horaFinal, String fecha, String categoria, String image) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = ""
					+ "INSERT INTO Eventos(nombre, descripcion, horaInicio, horaFinal, fecha, categoria, image) VALUES (\""+nombre+"\",\""+descripcion+"\",\""+horaInicio+"\",\""+horaFinal+"\",\""+fecha+"\",\""+categoria+"\",\""+image+"\");";
			stat.execute(query);

		stat.close();
		con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void deleteEvento(String idEvento) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = " DELETE FROM Eventos WHERE idEvento = "+idEvento+"";
			stat.execute(query);

		stat.close();
		con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	public static void editEvento(String idEvento, String nombre, String descripcion, String horaInicio, String horaFinal, String fecha, String categoria, String image) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = "UPDATE Eventos SET nombre=\""+nombre+"\",descripcion=\""+descripcion+"\",horaInicio=\""+horaInicio+"\",horaFinal=\""+horaFinal+"\",fecha=\""+fecha+"\",categoria=\""+categoria+"\",image=\""+image+"\" WHERE idEvento = "+idEvento+";";
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
