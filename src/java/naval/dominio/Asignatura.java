package naval.dominio;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Asignatura generated by hbm2java
 */
@Entity
@Table(name = "asignatura", catalog = "naval")
public class Asignatura implements java.io.Serializable {

    private Integer idasignatura;
    private Programa programa;
    private String nombre;
    private String codigo;
    private Integer creditos;
    private Integer semestre;
    private Integer ubicacion;
    private Set<ActividadDocencia> actividadDocencias = new HashSet<ActividadDocencia>(0);

    public Asignatura() {
    }

    public Asignatura(Programa programa) {
        this.programa = programa;
    }

    public Asignatura(Programa programa, String nombre, String codigo, Integer creditos, Integer semestre, Integer ubicacion, Set<ActividadDocencia> actividadDocencias) {
        this.programa = programa;
        this.nombre = nombre;
        this.codigo = codigo;
        this.creditos = creditos;
        this.semestre = semestre;
        this.ubicacion = ubicacion;
        this.actividadDocencias = actividadDocencias;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "idasignatura", unique = true, nullable = false)
    public Integer getIdasignatura() {
        return this.idasignatura;
    }

    public void setIdasignatura(Integer idasignatura) {
        this.idasignatura = idasignatura;
    }

    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "programa_idprograma", nullable = false)
    public Programa getPrograma() {
        return this.programa;
    }

    public void setPrograma(Programa programa) {
        this.programa = programa;
    }

    @Column(name = "nombre", length = 255)
    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Column(name = "codigo", length = 45)
    public String getCodigo() {
        return this.codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    @Column(name = "creditos")
    public Integer getCreditos() {
        return this.creditos;
    }

    public void setCreditos(Integer creditos) {
        this.creditos = creditos;
    }

    @Column(name = "semestre")
    public Integer getSemestre() {
        return this.semestre;
    }

    public void setSemestre(Integer semestre) {
        this.semestre = semestre;
    }

    @Column(name = "ubicacion")
    public Integer getUbicacion() {
        return this.ubicacion;
    }

    public void setUbicacion(Integer ubicacion) {
        this.ubicacion = ubicacion;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "asignatura")
    public Set<ActividadDocencia> getActividadDocencias() {
        return this.actividadDocencias;
    }

    public void setActividadDocencias(Set<ActividadDocencia> actividadDocencias) {
        this.actividadDocencias = actividadDocencias;
    }

}
