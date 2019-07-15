/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import java.util.List;

import Model.POJO.Formato;
import Model.UTIL.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Jipson Murillo
 */
public class FormatoDAO {
    public static List<Formato> getlist()
    {
        List<Formato> list=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
          Transaction tx=session.beginTransaction();
        String hql="from Formato";
        Query query =session.createQuery(hql);
        list = query.list();
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return list;
        
        
        
    }
    
    
    public static void Save(Formato ob)
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
        Formato ob= FormatoDAO.getbyID(id);
        Transaction tx=session.beginTransaction();
        session.delete(ob);
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
    }
    
    
    public static Formato getbyID(int id)
    {
        Formato obj=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
               obj =  (Formato) session.get(Formato.class, id);
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return obj;
    }
    public static String [] tableNameArray() {
        String [] data = new String[2];
        data[0]="ID";
        data[1]="NOMBRE";

        return data;
    }
}
