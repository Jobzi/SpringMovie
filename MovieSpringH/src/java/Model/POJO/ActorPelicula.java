package Model.POJO;
// Generated 26/06/2019 07:32:53 PM by Hibernate Tools 4.3.1



/**
 * ActorPelicula generated by hbm2java
 */
public class ActorPelicula  implements java.io.Serializable {


     private Integer aplId;
     private Actor actor;
     private Pelicula pelicula;
     private String aplPapel;

    public ActorPelicula() {
    }

	
    public ActorPelicula(String aplPapel) {
        this.aplPapel = aplPapel;
    }
    public ActorPelicula(Actor actor, Pelicula pelicula, String aplPapel) {
       this.actor = actor;
       this.pelicula = pelicula;
       this.aplPapel = aplPapel;
    }
   
    public Integer getAplId() {
        return this.aplId;
    }
    
    public void setAplId(Integer aplId) {
        this.aplId = aplId;
    }
    public Actor getActor() {
        return this.actor;
    }
    
    public void setActor(Actor actor) {
        this.actor = actor;
    }
    public Pelicula getPelicula() {
        return this.pelicula;
    }
    
    public void setPelicula(Pelicula pelicula) {
        this.pelicula = pelicula;
    }
    public String getAplPapel() {
        return this.aplPapel;
    }
    
    public void setAplPapel(String aplPapel) {
        this.aplPapel = aplPapel;
    }


        public String [] toStringArray() {
        String [] data = new String[4];
        data[0]=String.valueOf(this.aplId);
        data[1]=this.getActor().getActNombre();
        data[2]=this.getPelicula().getPelNombre();
        data[3]=this.aplPapel;
        return data;
    }

}


