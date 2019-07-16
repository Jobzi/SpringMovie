/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import java.util.List;

import Model.POJO.Socio;
import Model.UTIL.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Jipson Murillo
 */
public class SocioDAO {
    public static List<Socio> getlist()
    {
        List<Socio> list=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
          Transaction tx=session.beginTransaction();
        String hql="from Socio";
        Query query =session.createQuery(hql);
        list = query.list();
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return list;
        
        
        
    }
    
    
    public static void Save(Socio ob)
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
        Socio ob = SocioDAO.getbyID(id);
        session.delete(ob);
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
    }
    
    
    public static Socio getbyID(int id)
    {
        Socio obj=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
               obj =  (Socio) session.get(Socio.class, id);
               
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
        data[1]="CEDULA";
        data[2]="NOMBRE";
        data[3]="DIRECCION";
        data[4]="TELEFONO";
        data[5]="CORREO";
        return data;
    }
     public static List<Socio> getReporteNombre(String valor)
    {
        List<Socio> list=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        String hql="from Socio socio where socio.socCedula='"+valor+"'";
        Query query =session.createQuery(hql);
        list = query.list();
          System.out.println("********************************************");
            for (int i = 0; i < list.size(); i++) {
                System.out.println(" "+list.get(i).getSocNombre());
            }
             System.out.println("********************************************");
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return list;   
    }

}
