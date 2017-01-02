package naval.dominio;

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
 * Dias generated by hbm2java
 */
@Entity
@Table(name = "dias", catalog = "naval")
public class Dias implements java.io.Serializable {

    private Integer iddias;
    private String nombre;
    private Set<ParteDiario> parteDiarios = new HashSet<ParteDiario>(0);
    private Set<Horario> horarios = new HashSet<Horario>(0);

    public Dias() {
    }

    public Dias(String nombre) {
        this.nombre = nombre;
    }

    public Dias(String nombre, Set<ParteDiario> parteDiarios, Set<Horario> horarios) {
        this.nombre = nombre;
        this.parteDiarios = parteDiarios;
        this.horarios = horarios;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    @Column(name = "iddias", unique = true, nullable = false)
    public Integer getIddias() {
        return this.iddias;
    }

    public void setIddias(Integer iddias) {
        this.iddias = iddias;
    }

    @Column(name = "nombre", nullable = false, length = 45)
    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "dias")
    public Set<ParteDiario> getParteDiarios() {
        return this.parteDiarios;
    }

    public void setParteDiarios(Set<ParteDiario> parteDiarios) {
        this.parteDiarios = parteDiarios;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "dias")
    public Set<Horario> getHorarios() {
        return this.horarios;
    }

    public void setHorarios(Set<Horario> horarios) {
        this.horarios = horarios;
    }
}
