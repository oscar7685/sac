package naval.dominio;



import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Asignatura generated by hbm2java
 */
@Entity
@Table(name="asignatura"
    ,catalog="naval"
)
public class Asignatura  implements java.io.Serializable {


     private Integer idasignatura;
     private String nombre;
     private Set<ActividadDocencia> actividadDocencias = new HashSet<ActividadDocencia>(0);

    public Asignatura() {
    }

    public Asignatura(String nombre, Set<ActividadDocencia> actividadDocencias) {
       this.nombre = nombre;
       this.actividadDocencias = actividadDocencias;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idasignatura", unique=true, nullable=false)
    public Integer getIdasignatura() {
        return this.idasignatura;
    }
    
    public void setIdasignatura(Integer idasignatura) {
        this.idasignatura = idasignatura;
    }

    
    @Column(name="nombre", length=45)
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

@OneToMany(fetch=FetchType.LAZY, mappedBy="asignatura")
    public Set<ActividadDocencia> getActividadDocencias() {
        return this.actividadDocencias;
    }
    
    public void setActividadDocencias(Set<ActividadDocencia> actividadDocencias) {
        this.actividadDocencias = actividadDocencias;
    }




}


