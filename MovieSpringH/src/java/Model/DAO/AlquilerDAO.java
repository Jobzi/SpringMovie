/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import java.util.List;

import Model.POJO.Alquiler;
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
    
}
