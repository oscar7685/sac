package naval.dominio;
// Generated 21/12/2015 11:03:03 PM by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * Permisos generated by hbm2java
 */
@Entity
@Table(name="permisos"
    ,catalog="naval"
)
public class Permisos  implements java.io.Serializable {


     private int idpermisos;
     private String descripcion;
     private Set<Rol> rols = new HashSet<Rol>(0);

    public Permisos() {
    }

	
    public Permisos(int idpermisos, String descripcion) {
        this.idpermisos = idpermisos;
        this.descripcion = descripcion;
    }
    public Permisos(int idpermisos, String descripcion, Set<Rol> rols) {
       this.idpermisos = idpermisos;
       this.descripcion = descripcion;
       this.rols = rols;
    }
   
     @Id 

    
    @Column(name="idpermisos", unique=true, nullable=false)
    public int getIdpermisos() {
        return this.idpermisos;
    }
    
    public void setIdpermisos(int idpermisos) {
        this.idpermisos = idpermisos;
    }

    
    @Column(name="descripcion", nullable=false, length=45)
    public String getDescripcion() {
        return this.descripcion;
    }
    
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

@ManyToMany(fetch=FetchType.LAZY)
    @JoinTable(name="rol_has_permisos", catalog="naval", joinColumns = { 
        @JoinColumn(name="permisos_idpermisos", nullable=false, updatable=false) }, inverseJoinColumns = { 
        @JoinColumn(name="rol_codigo", nullable=false, updatable=false) })
    public Set<Rol> getRols() {
        return this.rols;
    }
    
    public void setRols(Set<Rol> rols) {
        this.rols = rols;
    }




}


