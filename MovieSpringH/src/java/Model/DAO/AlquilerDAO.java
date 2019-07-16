/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import java.util.List;

import Model.POJO.Alquiler;
import Model.POJO.Pelicula;
import Model.UTIL.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Jipson Murillo
 */
public class AlquilerDAO {
    public static List<Alquiler> getlist()
    {
        List<Alquiler> list=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
          Transaction tx=session.beginTransaction();
        String hql="from Alquiler";
        Query query =session.createQuery(hql);
        list = query.list();
         System.out.println("********************************************");
            for (int i = 0; i < list.size(); i++) {
                System.out.println("Alquiler "+list.get(i).getAlqId()
                                  +" Socio: " +list.get(i).getSocio().getSocId()  +" "+ list.get(i).getSocio().getSocNombre() 
                                  +" Pelicula: "+list.get(i).getPelicula().getPelId() +" "+ list.get(i).getPelicula().getPelNombre()
                                  +" Fechas: A | V | E "+list.get(i).getAlqFechaDesde()+" "+ list.get(i).getAlqFechaHasta()+" "+ list.get(i).getAlqFechaEntrega());
            }
             System.out.println("********************************************");
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return list;
        
        
        
    }
    
    
    public static void Save(Alquiler ob)
    {
        try{
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
        Alquiler ob = AlquilerDAO.getbyID(id);
        session.delete(ob);
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
    }
    
    
    public static Alquiler getbyID(int id)
    {
        Alquiler obj=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
               obj =  (Alquiler) session.get(Alquiler.class, id);
               obj.getPelicula().getPelId();
               obj.getPelicula().getPelNombre();
               obj.getSocio().getSocNombre();
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return obj;
    }
    public static String [] tableNameArray() {
        String [] data = new String[6];
        data[0]="ID";
        data[1]="PELICULA";
        data[2]="FECHA ALQUILER";
        data[3]="FECHA VENCIMIENTO";
        data[4]="FECHA ENTREGA";
        data[5]="PRECIO";
        return data;
    }
        public String getAlquileres(String valor) {
        String aumentador="";
        List<Pelicula> list = null;
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            String hql = "select pelicula from Pelicula pelicula, Alquiler alquiler, Socio socio where alquiler.socio.socId=socio.socId and alquiler.pelicula.pelId=pelicula.pelId and socio.socCedula='" + valor + "'";
            Query query = session.createQuery(hql);
            list = query.list();
            session.close();
        } catch (Exception E) {
            E.printStackTrace();
        }
        for (Pelicula cadena : list) {
            aumentador = aumentador.concat(cadena.getPelNombre())+"\n";
        }
        System.out.println(aumentador);

        return "Sus peliculas alquiladas son:\n"+aumentador;
    }
        public static List<Pelicula> getReporteAlquiler(String valor){
      List<Pelicula> list=null;
        try{
            
        Session session =HibernateUtil.getSessionFactory().openSession();
        String hql="select pelicula from Pelicula pelicula, Alquiler alquiler, Socio socio where alquiler.socio.socId=socio.socId and alquiler.pelicula.pelId=pelicula.pelId and socio.socNombre='"+valor+"'";
        Query query =session.createQuery(hql);
        list = query.list();
        System.out.println("********************************************");
            for (int i = 0; i < list.size(); i++) {
                System.out.println("Alquiler "+list.get(i).getPelNombre());
            }
             System.out.println("********************************************");
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return list;   
    }
}
