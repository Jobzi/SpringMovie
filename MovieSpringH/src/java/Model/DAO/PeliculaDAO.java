/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import java.util.List;

import Model.POJO.Pelicula;
import Model.UTIL.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Jipson Murillo
 */
public class PeliculaDAO {
    public static List<Pelicula> getlist()
    {
        List<Pelicula> list=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        String hql="from Pelicula";
        Query query =session.createQuery(hql);
        list = query.list();
         System.out.println("********************************************");
            for (int i = 0; i < list.size(); i++) {
                System.out.println(" "+list.get(i).getPelNombre()
                                  +" Genero: " +list.get(i).getGenero().getGenId()  +" "+ list.get(i).getGenero().getGenNombre() 
                                  +" Formato: "+list.get(i).getFormato().getForId() +" "+ list.get(i).getFormato().getForNombre()
                                  +" Director "+list.get(i).getDirector().getDirId()+" "+ list.get(i).getDirector().getDirNombre());
            }
             System.out.println("********************************************");
        
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return list;
        
        
        
    }
    
    
    public static void Save(Pelicula ob)
    {
        try{
       
        GeneroDAO.Save(ob.getGenero());
        FormatoDAO.Save(ob.getFormato());
        DirectorDAO.Save(ob.getDirector());
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
        
        
        session.saveOrUpdate(ob);
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
    }
    
    public static void Update(Pelicula ob)
    {
        try{
                 System.out.println("*****************UPDATE********************");    
        System.out.println(" "+ob.getPelNombre()
                                  +" Genero: " +ob.getGenero().getGenId()  +" "+ ob.getGenero().getGenNombre() 
                                  +" Formato: "+ob.getFormato().getForId() +" "+ ob.getFormato().getForNombre()
                                  +" Director "+ob.getDirector().getDirId()+" "+ ob.getDirector().getDirNombre());    
        GeneroDAO.Save(ob.getGenero());
        FormatoDAO.Save(ob.getFormato());
        DirectorDAO.Save(ob.getDirector());
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
        
        
        session.saveOrUpdate(ob);
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
    }
    public static void Delete(int id)
    {
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
        Pelicula ob = PeliculaDAO.getbyID(id);
        session.delete(ob);
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
    }
    
    
    public static Pelicula getbyID(int id)
    {
        Pelicula obj=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
               obj =  (Pelicula) session.get(Pelicula.class, id);
               obj.getDirector().getDirNombre();
               obj.getDirector().getDirId();
               obj.getDirector().getPeliculas();
               obj.getFormato().getForNombre();
               obj.getFormato().getForId();
               obj.getFormato().getPeliculas();
               obj.getGenero().getGenNombre();
               obj.getGenero().getGenId();
               obj.getGenero().getPeliculas();
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return obj;
    }
    public static List<Pelicula> getReporteValor(double valor)
    {
        List<Pelicula> list=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        String hql="from Pelicula pelicula where pelicula.pelCosto="+valor+"";
        Query query =session.createQuery(hql);
        list = query.list();
            System.out.println("********************************************");
            for (int i = 0; i < list.size(); i++) {
                System.out.println(" "+list.get(i).getPelNombre()
                                  +" Genero: " +list.get(i).getGenero().getGenId()  +" "+ list.get(i).getGenero().getGenNombre() 
                                  +" Formato: "+list.get(i).getFormato().getForId() +" "+ list.get(i).getFormato().getForNombre()
                                  +" Director "+list.get(i).getDirector().getDirId()+" "+ list.get(i).getDirector().getDirNombre());
            }
             System.out.println("********************************************");
        
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return list;   
    }
  public static String [] tableNameArray() {
        String [] data = new String[7];
        data[0]="ID";
        data[1]="NOMBRE";
        data[2]="GENERO";
        data[3]="DIRECTOR";
        data[4]="FECHA ESTRENO";
        data[5]="FORMATO";
        data[6]="COSTO";
        return data;
    }
}
