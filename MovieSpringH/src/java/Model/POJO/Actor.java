package Model.POJO;
// Generated 26/06/2019 07:32:53 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Actor generated by hbm2java
 */
public class Actor  implements java.io.Serializable {


     private Integer actId;
     private Sexo sexo;
     private String actNombre;
     private Set actorPeliculas = new HashSet(0);

    public Actor() {
    }

	
    public Actor(String actNombre) {
        this.actNombre = actNombre;
    }
    public Actor(Sexo sexo, String actNombre, Set actorPeliculas) {
       this.sexo = sexo;
       this.actNombre = actNombre;
       this.actorPeliculas = actorPeliculas;
    }
   
    public Integer getActId() {
        return this.actId;
    }
    
    public void setActId(Integer actId) {
        this.actId = actId;
    }
    public Sexo getSexo() {
        return this.sexo;
    }
    
    public void setSexo(Sexo sexo) {
        this.sexo = sexo;
    }
    public String getActNombre() {
        return this.actNombre;
    }
    
    public void setActNombre(String actNombre) {
        this.actNombre = actNombre;
    }
    public Set getActorPeliculas() {
        return this.actorPeliculas;
    }
    
    public void setActorPeliculas(Set actorPeliculas) {
        this.actorPeliculas = actorPeliculas;
    }

      public String [] toStringArray() {
        String [] data = new String[3];
        data[0]=String.valueOf(this.actId);
        data[1]=this.actNombre;
        data[2]=this.getSexo().getSexNombre();
        return data;
    }


}


