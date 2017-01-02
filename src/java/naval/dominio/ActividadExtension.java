package naval.dominio;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * ActividadExtension generated by hbm2java
 */
@Entity
@Table(name="actividad_extension"
    ,catalog="naval"
)
public class ActividadExtension  implements java.io.Serializable {


     private Integer idactividadExtension;
     private String codigo;
     private String actividad;
     private String responsabilidad;
     private String programaOBeneficiario;
     private Integer horasProg;
     private Integer horasEjec;
     private Integer horasSemanales;
     private Integer anio;
     private Integer periodo;

    public ActividadExtension() {
    }

    public ActividadExtension(String codigo, String actividad, String responsabilidad, String programaOBeneficiario, Integer horasProg, Integer horasEjec, Integer horasSemanales, Integer anio, Integer periodo) {
       this.codigo = codigo;
       this.actividad = actividad;
       this.responsabilidad = responsabilidad;
       this.programaOBeneficiario = programaOBeneficiario;
       this.horasProg = horasProg;
       this.horasEjec = horasEjec;
       this.horasSemanales = horasSemanales;
       this.anio = anio;
       this.periodo = periodo;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idactividad_extension", unique=true, nullable=false)
    public Integer getIdactividadExtension() {
        return this.idactividadExtension;
    }
    
    public void setIdactividadExtension(Integer idactividadExtension) {
        this.idactividadExtension = idactividadExtension;
    }

    
    @Column(name="codigo", length=45)
    public String getCodigo() {
        return this.codigo;
    }
    
    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    
    @Column(name="actividad", length=2000)
    public String getActividad() {
        return this.actividad;
    }
    
    public void setActividad(String actividad) {
        this.actividad = actividad;
    }

    
    @Column(name="responsabilidad", length=2000)
    public String getResponsabilidad() {
        return this.responsabilidad;
    }
    
    public void setResponsabilidad(String responsabilidad) {
        this.responsabilidad = responsabilidad;
    }

    
    @Column(name="programa o beneficiario", length=2000)
    public String getProgramaOBeneficiario() {
        return this.programaOBeneficiario;
    }
    
    public void setProgramaOBeneficiario(String programaOBeneficiario) {
        this.programaOBeneficiario = programaOBeneficiario;
    }

    
    @Column(name="horas_prog")
    public Integer getHorasProg() {
        return this.horasProg;
    }
    
    public void setHorasProg(Integer horasProg) {
        this.horasProg = horasProg;
    }

    
    @Column(name="horas_ejec")
    public Integer getHorasEjec() {
        return this.horasEjec;
    }
    
    public void setHorasEjec(Integer horasEjec) {
        this.horasEjec = horasEjec;
    }

    
    @Column(name="horas_semanales")
    public Integer getHorasSemanales() {
        return this.horasSemanales;
    }
    
    public void setHorasSemanales(Integer horasSemanales) {
        this.horasSemanales = horasSemanales;
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




}

