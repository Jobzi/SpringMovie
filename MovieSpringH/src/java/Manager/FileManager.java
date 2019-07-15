/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Manager;

/**
 *
 * @author Jipson Murillo
 */
import Model.DAO.ActorDAO;
import Model.DAO.ActorPeliculaDAO;
import Model.DAO.AlquilerDAO;
import Model.DAO.DirectorDAO;
import Model.DAO.FormatoDAO;
import Model.DAO.GeneroDAO;
import Model.DAO.PeliculaDAO;
import Model.DAO.SexoDAO;
import Model.DAO.SocioDAO;
import Model.POJO.Actor;
import Model.POJO.ActorPelicula;
import Model.POJO.Alquiler;
import Model.POJO.Director;
import Model.POJO.Formato;
import Model.POJO.Genero;
import Model.POJO.Pelicula;
import Model.POJO.Sexo;
import Model.POJO.Socio;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.*;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.FileOutputStream;
import java.nio.file.FileSystems;
import java.util.Date;
import java.util.List;


public class FileManager {

    String path="",docname,tag;
    Image Imagen;
    Document doc;
    Font fuente ;
    Paragraph header ;
    Paragraph dateline ;
    int columnSize;
    PdfPTable table;
    public FileManager(String dirfile,String tag,String pathImage,String Encabezado) {
        
        try{
        this.tag=tag;
        this.docname=this.tag+".pdf";
        doc =new  Document(PageSize.A4);
        fuente = new Font(Font.getFamily("arial"),12,Font.BOLD);
        header =new Paragraph(Encabezado,fuente);
        dateline =new Paragraph(new Date().toString(),fuente);
        this.getCurrentPath(dirfile);
          System.out.println("xxxxxx"+this.path);
        Imagen= Image.getInstance(pathImage); 
        Imagen.setAlignment(Image.LEFT);        
        
        }catch(Exception ex){
            System.err.println(ex.toString());
        }
    }
    private void chargeTestTable(){
       
        this.columnSize=5;
        table = new PdfPTable(this.columnSize); 
        PdfPCell cell = new PdfPCell(new Paragraph("CELDA",fuente));
        for (int i = 0; i < this.columnSize; i++) {
            table.addCell(cell);
        }
        for (int i = 0; i < this.columnSize; i++) {
             table.addCell("DATO");
        }
    }
    public void createModelTable(){
        
        switch(this.tag){
            case"actor":
            {
               List<Actor> list= ActorDAO.getlist();
               this.chargeHeaderTable(ActorDAO.tableNameArray());
                for (int i = 0; i < list.size(); i++) {
                    this.chargeValueTable(list.get(i).toStringArray());
                }
            }break;
            case"actorpelicula":
            {
               List<ActorPelicula> list= ActorPeliculaDAO.getlist();
               this.chargeHeaderTable(ActorPeliculaDAO.tableNameArray());
                for (int i = 0; i < list.size(); i++) {
                    this.chargeValueTable(list.get(i).toStringArray());
                }
            }break;
            case"pelicula":
            {
               List<Pelicula> list= PeliculaDAO.getlist();
               this.chargeHeaderTable(PeliculaDAO.tableNameArray());
                for (int i = 0; i < list.size(); i++) {
                    this.chargeValueTable(list.get(i).toStringArray());
                }
            }break;
            case"alquiler":
            {
               List<Alquiler> list= AlquilerDAO.getlist();
               this.chargeHeaderTable(AlquilerDAO.tableNameArray());
                for (int i = 0; i < list.size(); i++) {
                    this.chargeValueTable(list.get(i).toStringArray());
                }
            }break;
            case"director":
            {
               List<Director> list= DirectorDAO.getlist();
               this.chargeHeaderTable(DirectorDAO.tableNameArray());
                for (int i = 0; i < list.size(); i++) {
                    this.chargeValueTable(list.get(i).toStringArray());
                }
            }break;
            case"formato":
            {
               List<Formato> list= FormatoDAO.getlist();
               this.chargeHeaderTable(FormatoDAO.tableNameArray());
                for (int i = 0; i < list.size(); i++) {
                    this.chargeValueTable(list.get(i).toStringArray());
                }
            }break;
            case"genero":
            {
               List<Genero> list= GeneroDAO.getlist();
               this.chargeHeaderTable(GeneroDAO.tableNameArray());
                for (int i = 0; i < list.size(); i++) {
                    this.chargeValueTable(list.get(i).toStringArray());
                }
            }break;
            
            case"socio":
            {
               List<Socio> list= SocioDAO.getlist();
               this.chargeHeaderTable(SocioDAO.tableNameArray());
                for (int i = 0; i < list.size(); i++) {
                    this.chargeValueTable(list.get(i).toStringArray());
                }
            }break;
            case"sexo":
            {
               
               List<Sexo> list= SexoDAO.getlist();
               this.chargeHeaderTable(SexoDAO.tableNameArray());
                for (int i = 0; i < list.size(); i++) {
                    this.chargeValueTable(list.get(i).toStringArray());
                }
            }break;
        }
    }
    private void chargeHeaderTable(String []ColumnNames){
        this.columnSize=ColumnNames.length;
        table = new PdfPTable(this.columnSize); 
        table.setWidthPercentage(100);
        for (int i = 0; i < ColumnNames.length; i++) {
            PdfPCell cell = new PdfPCell(new Paragraph(ColumnNames[i],fuente));
            table.addCell(cell);
        }
    }
    private void chargeValueTable(String[] values){
      
        for (int i = 0; i < values.length; i++) {
             table.addCell(values[i]);
        }
    }
    
    private void getCurrentPath(String filename)
    {
          this.path = filename+"\\"+this.docname;
    }        
    public void  createPdfFile(){

        try
        {
            
            PdfWriter.getInstance(doc,new FileOutputStream(this.path));
            
      
            doc.open();
            doc.add(Imagen);
            doc.add(header);
            doc.add(dateline);
            doc.add(new Paragraph("",fuente));
            //this.chargeTestTable();
            this.createModelTable();
            doc.add(table);
            doc.close();
            System.out.println("========salio==============");
            System.out.println(this.path);
        }catch (Exception e){
            System.err.println("EX"+e.getMessage());
        }
         
        
     }

    public String getPath() {
        return path;
    }

    public String getDocname() {
        return docname;
    }
    
}
