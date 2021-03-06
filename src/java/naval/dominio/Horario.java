package naval.dominio;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Horario generated by hbm2java
 */
@Entity
@Table(name="horario"
    ,catalog="naval"
)
public class Horario  implements java.io.Serializable {


     private Integer idhorario;
     private Aula aula;
     private Curso curso;
     private Dias dias;
     private Hora hora;
     private Profesor profesor;

    public Horario() {
    }

    public Horario(Aula aula, Curso curso, Dias dias, Hora hora, Profesor profesor) {
       this.aula = aula;
       this.curso = curso;
       this.dias = dias;
       this.hora = hora;
       this.profesor = profesor;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="idhorario", unique=true, nullable=false)
    public Integer getIdhorario() {
        return this.idhorario;
    }
    
    public void setIdhorario(Integer idhorario) {
        this.idhorario = idhorario;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="aula_idaula", nullable=false)
    public Aula getAula() {
        return this.aula;
    }
    
    public void setAula(Aula aula) {
        this.aula = aula;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="curso_idcurso", nullable=false)
    public Curso getCurso() {
        return this.curso;
    }
    
    public void setCurso(Curso curso) {
        this.curso = curso;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="dias_iddias", nullable=false)
    public Dias getDias() {
        return this.dias;
    }
    
    public void setDias(Dias dias) {
        this.dias = dias;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="hora_idhorario", nullable=false)
    public Hora getHora() {
        return this.hora;
    }
    
    public void setHora(Hora hora) {
        this.hora = hora;
    }

@ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="profesor_idprofesor", nullable=false)
    public Profesor getProfesor() {
        return this.profesor;
    }
    
    public void setProfesor(Profesor profesor) {
        this.profesor = profesor;
    }




}


