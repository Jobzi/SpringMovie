package Model.POJO;
// Generated 26/06/2019 07:32:53 PM by Hibernate Tools 4.3.1


import java.math.BigDecimal;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import org.springframework.format.annotation.DateTimeFormat;
/**
 * Pelicula generated by hbm2java
 */
public class Pelicula  implements java.io.Serializable {


     private Integer pelId;
     private Director director;
     private Formato formato;
     private Genero genero;
     private String pelNombre;
     private BigDecimal pelCosto;
     @DateTimeFormat(pattern = "dd/MM/yyyy")
     private Date pelFechaEstreno;
     private Set actorPeliculas = new HashSet(0);
     private Set alquilers = new HashSet(0);

    public Pelicula() {
    }

	
    public Pelicula(String pelNombre, BigDecimal pelCosto) {
        this.pelNombre = pelNombre;
        this.pelCosto = pelCosto;
    }
    public Pelicula(Director director, Formato formato, Genero genero, String pelNombre, BigDecimal pelCosto, Date pelFechaEstreno, Set actorPeliculas, Set alquilers) {
       this.director = director;
       this.formato = formato;
       this.genero = genero;
       this.pelNombre = pelNombre;
       this.pelCosto = pelCosto;
       this.pelFechaEstreno = pelFechaEstreno;
       this.actorPeliculas = actorPeliculas;
       this.alquilers = alquilers;
    }
   
    public Integer getPelId() {
        return this.pelId;
    }
    
    public void setPelId(Integer pelId) {
        this.pelId = pelId;
    }
    public Director getDirector() {
        return this.director;
    }
    
    public void setDirector(Director director) {
        this.director = director;
    }
    public Formato getFormato() {
        return this.formato;
    }
    
    public void setFormato(Formato formato) {
        this.formato = formato;
    }
    public Genero getGenero() {
        return this.genero;
    }
    
    public void setGenero(Genero genero) {
        this.genero = genero;
    }
    public String getPelNombre() {
        return this.pelNombre;
    }
    
    public void setPelNombre(String pelNombre) {
        this.pelNombre = pelNombre;
    }
    public BigDecimal getPelCosto() {
        return this.pelCosto;
    }
    
    public void setPelCosto(BigDecimal pelCosto) {
        this.pelCosto = pelCosto;
    }
    public Date getPelFechaEstreno() {
        return this.pelFechaEstreno;
    }
    
    public void setPelFechaEstreno(Date pelFechaEstreno) {
        this.pelFechaEstreno = pelFechaEstreno;
    }
    public Set getActorPeliculas() {
        return this.actorPeliculas;
    }
    
    public void setActorPeliculas(Set actorPeliculas) {
        this.actorPeliculas = actorPeliculas;
    }
    public Set getAlquilers() {
        return this.alquilers;
    }
    
    public void setAlquilers(Set alquilers) {
        this.alquilers = alquilers;
    }

        public String [] toStringArray() {
        String [] data = new String[7];
        data[0]=String.valueOf(this.pelId);
        data[1]=this.pelNombre;
        data[2]=this.getGenero().getGenNombre();
        data[3]=this.getDirector().getDirNombre();
        data[4]=this.pelFechaEstreno.toString();
        data[5]=this.getFormato().getForNombre();
        data[6]=String.valueOf(this.pelCosto);
        return data;
    }


}


