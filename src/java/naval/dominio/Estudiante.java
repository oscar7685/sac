package naval.dominio;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

/**
 * Estudiante generated by hbm2java
 */
@Entity
@Table(name = "estudiante", catalog = "naval"
)
public class Estudiante implements java.io.Serializable {

    private Integer codigo;
    private String nombres;
    private String apellidos;
    private Set<Curso> cursos = new HashSet<Curso>(0);

    public Estudiante() {
    }

    public Estudiante(String nombres, String apellidos, Set<Curso> cursos) {
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.cursos = cursos;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "codigo", unique = true, nullable = false)
    public Integer getCodigo() {
        return this.codigo;
    }

    public void setCodigo(Integer codigo) {
        this.codigo = codigo;
    }

    @Column(name = "nombres")
    public String getNombres() {
        return this.nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    @Column(name = "apellidos")
    public String getApellidos() {
        return this.apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "curso_has_estudiante", catalog = "naval", joinColumns = {
        @JoinColumn(name = "estudiante_codigo", nullable = false, updatable = false)}, inverseJoinColumns = {
        @JoinColumn(name = "curso_idcurso", nullable = false, updatable = false)})
    public Set<Curso> getCursos() {
        return this.cursos;
    }

    public void setCursos(Set<Curso> cursos) {
        this.cursos = cursos;
    }

}
