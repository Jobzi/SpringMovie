/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model.DAO;

import java.util.List;
import Model.POJO.ActorPelicula;
import Model.UTIL.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Jipson Murillo
 */
public class ActorPeliculaDAO {
    public static List<ActorPelicula> getlist()
    {
        List<ActorPelicula> list=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
        String sql="select * from actor_Pelicula";
        Query query =session.createSQLQuery(sql).addEntity(ActorPelicula.class);
        
        
        list = ( List<ActorPelicula>)query.list();
         System.out.println("********************************************");
            for (int i = 0; i < list.size(); i++) {
                System.out.println(list.get(i).getAplId()+" "+list.get(i).getAplPapel()+" Actor: "+list.get(i).getActor().getActId()+" "+list.get(i).getActor().getActNombre()
                                   +" Pelicula: "+list.get(i).getPelicula().getPelId()+" "+list.get(i).getPelicula().getPelNombre());
            }
             System.out.println("********************************************");
          tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return list;
        
        
        
    }
    
    
    public static void Save(ActorPelicula ob)
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
        ActorPelicula ob=ActorPeliculaDAO.getbyID(id);
        session.delete(ob);
        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
    }
    
    
    public static ActorPelicula getbyID(int id)
    {
        ActorPelicula obj=null;
        try{
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.beginTransaction();
               obj =  (ActorPelicula) session.get(ActorPelicula.class, id);
               obj.getActor().getActId();
               obj.getActor().getActNombre();
               obj.getActor().getActorPeliculas();
               obj.getPelicula().getPelNombre();
               obj.getPelicula().getPelId();

        tx.commit();
        session.close();
        }catch(Exception E){
            E.printStackTrace();
        }
        return obj;
    }
     public static String [] tableNameArray() {
        String [] data = new String[4];
        data[0]="ID";
        data[1]="ACTOR";
        data[2]="PELICULA";
        data[3]="PAPEL";
        return data;
    }
}
