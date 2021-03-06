package naval.dominio;



import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * SeguimientoActividades generated by hbm2java
 */
@Entity
@Table(name="seguimiento_actividades"
    ,catalog="naval"
)
public class SeguimientoActividades  implements java.io.Serializable {


     private Integer idseguimientoActividades;
     private Profesor profesor;
     private Integer anio;
     private Integer periodo;
     private String codigo;
     private String identificacionActividad;
     private Date fechaInformes;
     private Integer horasSemanales;

    public SeguimientoActividades() {
    }

	
    public SeguimientoActividades(Profesor profesor) {
        this.profesor = profesor;
    }
    public SeguimientoActividades(Profesor profesor, Integer anio, Integer periodo, String codigo, String identificacionActividad, Date fechaInformes, Integer horasSemanales) {
       this.profesor = profesor;
       this.anio = anio;
       this.periodo = periodo;
       this.codigo = codigo;
       this.identificacionActividad = identificacionActividad;
       this.fechaInformes = fechaInformes;
       this.horasSemanales = horasSemanales;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idseguimiento_actividades", unique=true, nullable=false)
    public Integer getIdseguimientoActividades() {
        return this.idseguimientoActividades;
    }
    
    public void setIdseguimientoActividades(Integer idseguimientoActividades) {
        this.idseguimientoActividades = idseguimientoActividades;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="profesor_idprofesor", nullable=false)
    public Profesor getProfesor() {
        return this.profesor;
    }
    
    public void setProfesor(Profesor profesor) {
        this.profesor = profesor;
    }

    
    @Column(name="anio")
    public Integer getAnio() {
        return this.anio;
    }
    
    public void setAnio(Integer anio) {
        this.anio = anio;
    }

    
    @Column(name="periodo")
    public Integer getPeriodo() {
        return this.periodo;
    }
    
    public void setPeriodo(Integer periodo) {
        this.periodo = periodo;
    }

    
    @Column(name="codigo", length=45)
    public String getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    
    @Column(name="identificacion_actividad")
    public String getIdentificacionActividad() {
        return this.identificacionActividad;
    }
    
    public void setIdentificacionActividad(String identificacionActividad) {
        this.identificacionActividad = identificacionActividad;
    }

    @Temporal(TemporalType.DATE)
    @Column(name="fecha_informes", length=10)
    public Date getFechaInformes() {
        return this.fechaInformes;
    }
    
    public void setFechaInformes(Date fechaInformes) {
        this.fechaInformes = fechaInformes;
    }

    
    @Column(name="horas_semanales")
    public Integer getHorasSemanales() {
        return this.horasSemanales;
    }
    
    public void setHorasSemanales(Integer horasSemanales) {
        this.horasSemanales = horasSemanales;
    }




}


