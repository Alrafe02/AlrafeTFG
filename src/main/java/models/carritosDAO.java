package models;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import utils.ConexionBD;

public class carritosDAO {

	public static String buscarCarritoPorEmail(String email){
		String idCarritos="";
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT * FROM Carritos WHERE emailCliente = \""+email+"\"";
			rs = stmt.executeQuery(query);
			while (rs.next()) {
				idCarritos = rs.getString("idCarritos");

			}
			
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return idCarritos;
	}
	public static void deleteProductoFromCarrito(String idCarritos, String idProductos) {

		String query="";
		Statement stat;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			query = "DELETE FROM Productos_has_Carritos WHERE Productos_idProductos = "+idProductos+" AND Carritos_idCarritos = "+idCarritos;
			System.out.println(query);
			stat.execute(query);

		stat.close();
		con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void addProductoToCarrito(String idCarritos, String idProductos, String quantity) {

		String query="";
		Statement stat,stat2;
		Connection con = ConexionBD.conectarBD();
		try {
			stat = con.createStatement();
			
			query = "DELETE FROM Productos_has_Carritos WHERE Productos_idProductos = "+idProductos+" AND Carritos_idCarritos = "+idCarritos;
			stat.execute(query);

		stat.close();
		stat2 = con.createStatement();
		query ="INSERT INTO Productos_has_Carritos(Productos_idProductos, Carritos_idCarritos, cantidad) VALUES ("+idProductos+", "+idCarritos+", "+quantity+");";
		stat2.execute(query);
		stat2.close();
				con.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static ArrayList<productosVO> listaProductosPorIdCarrito(String IdCarritos){
		ArrayList<productosVO> productos = new ArrayList<productosVO>();
		ResultSet rs;
		String query="";
		Statement stmt;
		Connection con = ConexionBD.conectarBD();
		
		try {
			stmt = con.createStatement();
			query = "SELECT distinct Productos_has_Carritos.cantidad, Productos.*  FROM \r\n"
					+ "Productos, Productos_has_Carritos, Carritos\r\n"
					+ "WHERE "+IdCarritos+" = Productos_has_Carritos.Carritos_idCarritos AND Productos_has_Carritos.Productos_idProductos = Productos.idProductos;";
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
						rs.getBoolean("destacado"),
						rs.getInt("cantidad")
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





}
