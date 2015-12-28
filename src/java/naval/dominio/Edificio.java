package naval.dominio;
// Generated 21/12/2015 11:03:03 PM by Hibernate Tools 4.3.1

import com.fasterxml.jackson.annotation.JsonIgnore;
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
 * Edificio generated by hbm2java
 */
@Entity
@Table(name = "edificio", catalog = "naval"
)
public class Edificio implements java.io.Serializable {

    private Integer idedificio;
    private String nombre;
    private Integer pisos;
    private Set<Aula> aulas = new HashSet<Aula>(0);

    public Edificio() {
    }

    public Edificio(String nombre, Integer pisos, Set<Aula> aulas) {
        this.nombre = nombre;
        this.pisos = pisos;
        this.aulas = aulas;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "idedificio", unique = true, nullable = false)
    public Integer getIdedificio() {
        return this.idedificio;
    }

    public void setIdedificio(Integer idedificio) {
        this.idedificio = idedificio;
    }

    @Column(name = "nombre", length = 45)
    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Column(name = "pisos")
    public Integer getPisos() {
        return this.pisos;
    }

    public void setPisos(Integer pisos) {
        this.pisos = pisos;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "edificio")
    public Set<Aula> getAulas() {
        return this.aulas;
    }

    public void setAulas(Set<Aula> aulas) {
        this.aulas = aulas;
    }

    @Override
    public String toString() {
        return "id:" + this.idedificio;
    }

}
