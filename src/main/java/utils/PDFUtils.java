package utils;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;


import java.lang.System;
import models.productosVO;


public class PDFUtils {
	public static final String EXPLORADOR_ARCHIVOS_USUARIO = System.getProperty("user.home");
	public static final String UBICACION_PDF = EXPLORADOR_ARCHIVOS_USUARIO+"\\Downloads";
	public static final BaseColor COLOR = new BaseColor(166, 211, 160);
	public static final String UBICACION_IMAGEN = "http://localhost:8080/TFG_Alrafe/Resources/LogoTfg.png";

	public static void eliminarPdfServidor(File pdf) {
		if(pdf.delete()) {
			System.out.println("El PDF "+pdf.getName()+" ha sido eliminado");
		} else {
			System.out.println("El PDF "+pdf.getName()+" no sa sido eliminado");
		}
	}
	
	public static void descargarPdf(File ubicacion_pdf, String codigo, String tipoLista, HttpServletResponse response) throws IOException {
		response.setContentType("application/x-pdf");  
		PrintWriter out = response.getWriter();  
		String filename = "pedido.pdf";    
		response.setContentType("APPLICATION/OCTET-STREAM");   
		response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
		FileInputStream fileInputStream = new FileInputStream(ubicacion_pdf+"\\"+filename);            
		int i;   
		while ((i=fileInputStream.read()) != -1) {  
			out.write(i);   
		}   
		fileInputStream.close();   
		out.close();
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void crearPdfPedido(File ubicacion_pdf, ArrayList<productosVO> Productos, String email, ArrayList<Integer> Cantidad) throws MalformedURLException, IOException {
		
	    // Aquí introduciremos el código para crear el PDF.
		try {
		    Document document = new Document();
		    document.setMargins(0, 0, 0, 0);
		    try {
		        PdfWriter.getInstance(document, new FileOutputStream(ubicacion_pdf+"\\Pedido.pdf"));
		    } catch (FileNotFoundException fileNotFoundException) {
		        System.out.println("No se pudo generar " + fileNotFoundException);
		    }
		    document.open();

		 Integer numColumns = 3;
		 ArrayList<String> cabeceraR1 = new ArrayList<String>();
		 ArrayList<String> cabeceraR2 = new ArrayList<String>();
		 ArrayList<String> textoCeldas = new ArrayList<String>();
	
    	 Image logoImg = Image.getInstance(UBICACION_IMAGEN);
    	 numColumns = 7;
    	 PdfPTable tablaLogo = new PdfPTable(numColumns);
    	 PdfPCell celdaLogo;
    	 
    	 
    	 celdaLogo = new PdfPCell();
    	 celdaLogo.setBorder(0);
    	 tablaLogo.addCell(celdaLogo);
    	 celdaLogo = new PdfPCell();
    	 celdaLogo.setBorder(0);
    	 tablaLogo.addCell(celdaLogo);
    	 celdaLogo = new PdfPCell();
    	 celdaLogo.setBorder(0);
    	 tablaLogo.addCell(celdaLogo);
    	 celdaLogo = new PdfPCell(logoImg);
    	 celdaLogo.setHorizontalAlignment(Element.ALIGN_CENTER);
    	 celdaLogo.setVerticalAlignment(Element.ALIGN_MIDDLE);
    	 celdaLogo.setColspan(1);
    	 celdaLogo.setPaddingBottom(10);
    	 celdaLogo.setBorder(0);
    	 tablaLogo.addCell(celdaLogo);
    	 celdaLogo = new PdfPCell();
    	 celdaLogo.setBorder(0);
    	 tablaLogo.addCell(celdaLogo);
    	 celdaLogo = new PdfPCell();
    	 celdaLogo.setBorder(0);
    	 tablaLogo.addCell(celdaLogo);
    	 celdaLogo = new PdfPCell();
    	 celdaLogo.setBorder(0);
    	 tablaLogo.addCell(celdaLogo);
    	 
    	 numColumns = 2;
    	 PdfPTable table = new PdfPTable(numColumns); 
    	 
    	 PdfPCell columnHeader;
  
    	 cabeceraR1.add("EMAIL");
		 cabeceraR1.add("FECHA");
    	 for (int column = 0; column < numColumns; column++) {
    	     columnHeader = new PdfPCell(new Phrase(cabeceraR1.get(column)));
    	     columnHeader.setHorizontalAlignment(Element.ALIGN_CENTER);
    	     columnHeader.setBackgroundColor(COLOR);
    	     table.addCell(columnHeader);
    	 }
    	 table.setHeaderRows(1);
	     table.addCell(email);
	     table.addCell("19/12/2022");

	    
	
		 Float precioTotalTotal = 0F;
		 //TABLA 3
		 numColumns = 5;
		 
		 PdfPTable table3 = new PdfPTable(numColumns); 
	
		 PdfPCell columnHeader3;
		 cabeceraR2.add("PRODUCTO");
		 cabeceraR2.add("DESCRIPCION");
		 cabeceraR2.add("CANTIDAD");
		 cabeceraR2.add("PRECIO");
		 cabeceraR2.add("PRECIO TOTAL");
		 for (int column = 0; column < numColumns; column++) {
		     columnHeader3 = new PdfPCell(new Phrase(cabeceraR2.get(column)));
		     columnHeader3.setHorizontalAlignment(Element.ALIGN_CENTER);
		     columnHeader3.setBackgroundColor(COLOR);
		     table3.addCell(columnHeader3);
		 }
		 table3.setHeaderRows(1);
		 
		 
		 for(int e= 0 ;e<Productos.size();e++) {
			 productosVO producto = null;
			 producto = Productos.get(e);

			 Float precioTotal =  producto.getPrecio() * Cantidad.get(e);
			 precioTotalTotal = precioTotalTotal + precioTotal;
				 table3.addCell(producto.getNombre());
				 table3.addCell(producto.getDescripcion());
				 table3.addCell(Integer.toString(Cantidad.get(e)));
				 table3.addCell(Float.toString(producto.getPrecio()));
				 table3.addCell(Float.toString(precioTotal));
				 
			 
		 }
		 table3.addCell("");
		 table3.addCell("");
		 table3.addCell("");
		 table3.addCell("Precio total pagado: ");
		 table3.addCell(Float.toString(precioTotalTotal));
		 
		 
	     
	     
		 //AÑADIR TABLA
	     table.setWidthPercentage(90);
		 table3.setWidthPercentage(90);
	 	 document.add(tablaLogo);
		 document.add(table);
		 document.add(table3);
		 document.close();
		 System.out.println("Se generó el PDF");
		} catch (DocumentException documentException) {
		    System.out.println("No se ha generado el documento: " + documentException);
		}
	}
	
	
	}

	