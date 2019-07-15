/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import java.util.List;
import Model.POJO.Actor;
import Model.POJO.Sexo;
import Model.UTIL.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Jipson Murillo
 */
public class ActorDAO {
    public static List<Actor> getlist()
    {
        List<Actor> list=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        
         Transaction tx=session.beginTransaction();
        String hql="from Actor";
        Query query =session.createQuery(hql);
        list = query.list();
             System.out.println("********************************************");
            for (int i = 0; i < list.size(); i++) {
                System.out.println(" "+list.get(i).getActNombre()+" Sexo: "+list.get(i).getSexo().getSexId()+" "+list.get(i).getSexo().getSexNombre());
            }
             System.out.println("********************************************");
             tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return list;
        
        
        
    }
    
    
    public static void Save(Actor ac)
    {
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
        session.saveOrUpdate(ac);
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
        Actor ob=ActorDAO.getbyID(id);
        session.delete(ob);
        tx.commit();  
        session.close();
  
       }catch(Exception E){
            E.printStackTrace();
        }
    }
    
    
    public static Actor getbyID(int id)
    {
        Actor actor=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
               actor =  (Actor) session.get(Actor.class, id);
               actor.getSexo().getSexId();
               actor.getSexo().getSexNombre();
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return actor;
    }
     public static String [] tableNameArray() {
        String [] data = new String[3];
        data[0]="ID";
        data[1]="NOMBRE";
        data[2]="SEXO";
        return data;
    }
}
