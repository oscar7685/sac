package naval.dominio;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Profesor generated by hbm2java
 */
@Entity
@Table(name = "profesor", catalog = "naval"
)
public class Profesor implements java.io.Serializable {

    private Integer idprofesor;
    private Facultad facultad;
    private String codigo;
    private String tipoId;
    private String numeroId;
    private String primerNombre;
    private String segundoNombre;
    private String primerApellido;
    private String segundoApellido;
    private String nivelMaxFormacion;
    private String fechaIngreso;
    private String grado;
    private String dedicacionDocente;
    private Date fechaNacimiento;
    private String genero;
    private String estadoCivil;
    private String correo;
    private String telefono;
    private String tipoContrato;
    private String duracionHoras;
    private Set<AdministracionAcademica> administracionAcademicas = new HashSet<AdministracionAcademica>(0);
    private Set<ActividadInvestigacion> actividadInvestigacions = new HashSet<ActividadInvestigacion>(0);
    private Set<EstudiosRealizadosDocente> estudiosRealizadosDocentes = new HashSet<EstudiosRealizadosDocente>(0);
    private Set<ActividadDocencia> actividadDocencias = new HashSet<ActividadDocencia>(0);
    private Set<OtrasActividades> otrasActividadeses = new HashSet<OtrasActividades>(0);
    private Set<ObservacionesGenerales> observacionesGeneraleses = new HashSet<ObservacionesGenerales>(0);
    private Set<Horario> horarios = new HashSet<Horario>(0);
    private Set<SeguimientoActividades> seguimientoActividadeses = new HashSet<SeguimientoActividades>(0);

    public Profesor() {
    }

    public Profesor(Facultad facultad, String codigo, String tipoId, String primerNombre, String dedicacionDocente) {
        this.facultad = facultad;
        this.codigo = codigo;
        this.tipoId = tipoId;
        this.primerNombre = primerNombre;
        this.dedicacionDocente = dedicacionDocente;
    }

    public Profesor(Facultad facultad, String codigo, String tipoId, String numeroId, String primerNombre, String segundoNombre, String primerApellido, String segundoApellido, String nivelMaxFormacion, String fechaIngreso, String grado, String dedicacionDocente, Date fechaNacimiento, String genero, String estadoCivil, String correo, String telefono, String tipoContrato, String duracionHoras, Set<AdministracionAcademica> administracionAcademicas, Set<ActividadInvestigacion> actividadInvestigacions, Set<EstudiosRealizadosDocente> estudiosRealizadosDocentes, Set<ActividadDocencia> actividadDocencias, Set<OtrasActividades> otrasActividadeses, Set<ObservacionesGenerales> observacionesGeneraleses, Set<Horario> horarios, Set<SeguimientoActividades> seguimientoActividadeses) {
        this.facultad = facultad;
        this.codigo = codigo;
        this.tipoId = tipoId;
        this.numeroId = numeroId;
        this.primerNombre = primerNombre;
        this.segundoNombre = segundoNombre;
        this.primerApellido = primerApellido;
        this.segundoApellido = segundoApellido;
        this.nivelMaxFormacion = nivelMaxFormacion;
        this.fechaIngreso = fechaIngreso;
        this.grado = grado;
        this.dedicacionDocente = dedicacionDocente;
        this.fechaNacimiento = fechaNacimiento;
        this.genero = genero;
        this.estadoCivil = estadoCivil;
        this.correo = correo;
        this.telefono = telefono;
        this.tipoContrato = tipoContrato;
        this.duracionHoras = duracionHoras;
        this.administracionAcademicas = administracionAcademicas;
        this.actividadInvestigacions = actividadInvestigacions;
        this.estudiosRealizadosDocentes = estudiosRealizadosDocentes;
        this.actividadDocencias = actividadDocencias;
        this.otrasActividadeses = otrasActividadeses;
        this.observacionesGeneraleses = observacionesGeneraleses;
        this.horarios = horarios;
        this.seguimientoActividadeses = seguimientoActividadeses;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)

    @Column(name = "idprofesor", unique = true, nullable = false)
    public Integer getIdprofesor() {
        return this.idprofesor;
    }

    public void setIdprofesor(Integer idprofesor) {
        this.idprofesor = idprofesor;
    }

    @JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "facultad_idfacultad", nullable = false)
    public Facultad getFacultad() {
        return this.facultad;
    }

    public void setFacultad(Facultad facultad) {
        this.facultad = facultad;
    }

    @Column(name = "codigo", nullable = false)
    public String getCodigo() {
        return this.codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    @Column(name = "tipo_id", nullable = false, length = 45)
    public String getTipoId() {
        return this.tipoId;
    }

    public void setTipoId(String tipoId) {
        this.tipoId = tipoId;
    }

    @Column(name = "numero_id", length = 45)
    public String getNumeroId() {
        return this.numeroId;
    }

    public void setNumeroId(String numeroId) {
        this.numeroId = numeroId;
    }

    @Column(name = "primer_nombre", nullable = false, length = 45)
    public String getPrimerNombre() {
        return this.primerNombre;
    }

    public void setPrimerNombre(String primerNombre) {
        this.primerNombre = primerNombre;
    }

    @Column(name = "segundo_nombre", length = 45)
    public String getSegundoNombre() {
        return this.segundoNombre;
    }

    public void setSegundoNombre(String segundoNombre) {
        this.segundoNombre = segundoNombre;
    }

    @Column(name = "primer_apellido", length = 45)
    public String getPrimerApellido() {
        return this.primerApellido;
    }

    public void setPrimerApellido(String primerApellido) {
        this.primerApellido = primerApellido;
    }

    @Column(name = "segundo apellido", length = 45)
    public String getSegundoApellido() {
        return this.segundoApellido;
    }

    public void setSegundoApellido(String segundoApellido) {
        this.segundoApellido = segundoApellido;
    }

    @Column(name = "nivel_max_formacion", length = 45)
    public String getNivelMaxFormacion() {
        return this.nivelMaxFormacion;
    }

    public void setNivelMaxFormacion(String nivelMaxFormacion) {
        this.nivelMaxFormacion = nivelMaxFormacion;
    }

    @Column(name = "fecha_ingreso", length = 45)
    public String getFechaIngreso() {
        return this.fechaIngreso;
    }

    public void setFechaIngreso(String fechaIngreso) {
        this.fechaIngreso = fechaIngreso;
    }

    @Column(name = "grado", length = 45)
    public String getGrado() {
        return this.grado;
    }

    public void setGrado(String grado) {
        this.grado = grado;
    }

    @Column(name = "dedicacion_docente", nullable = false, length = 45)
    public String getDedicacionDocente() {
        return this.dedicacionDocente;
    }

    public void setDedicacionDocente(String dedicacionDocente) {
        this.dedicacionDocente = dedicacionDocente;
    }

    @Temporal(TemporalType.DATE)
    @Column(name = "fecha_nacimiento", length = 10)
    public Date getFechaNacimiento() {
        return this.fechaNacimiento;
    }

    public void setFechaNacimiento(Date fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    @Column(name = "genero", length = 45)
    public String getGenero() {
        return this.genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    @Column(name = "estado_civil", length = 45)
    public String getEstadoCivil() {
        return this.estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    @Column(name = "correo", length = 45)
    public String getCorreo() {
        return this.correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    @Column(name = "telefono", length = 45)
    public String getTelefono() {
        return this.telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Column(name = "tipo_contrato", length = 45)
    public String getTipoContrato() {
        return this.tipoContrato;
    }

    public void setTipoContrato(String tipoContrato) {
        this.tipoContrato = tipoContrato;
    }

    @Column(name = "duracion_horas", length = 45)
    public String getDuracionHoras() {
        return this.duracionHoras;
    }

    public void setDuracionHoras(String duracionHoras) {
        this.duracionHoras = duracionHoras;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "profesor")
    public Set<AdministracionAcademica> getAdministracionAcademicas() {
        return this.administracionAcademicas;
    }

    public void setAdministracionAcademicas(Set<AdministracionAcademica> administracionAcademicas) {
        this.administracionAcademicas = administracionAcademicas;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "profesor")
    public Set<ActividadInvestigacion> getActividadInvestigacions() {
        return this.actividadInvestigacions;
    }

    public void setActividadInvestigacions(Set<ActividadInvestigacion> actividadInvestigacions) {
        this.actividadInvestigacions = actividadInvestigacions;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "profesor")
    public Set<EstudiosRealizadosDocente> getEstudiosRealizadosDocentes() {
        return this.estudiosRealizadosDocentes;
    }

    public void setEstudiosRealizadosDocentes(Set<EstudiosRealizadosDocente> estudiosRealizadosDocentes) {
        this.estudiosRealizadosDocentes = estudiosRealizadosDocentes;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "profesor")
    public Set<ActividadDocencia> getActividadDocencias() {
        return this.actividadDocencias;
    }

    public void setActividadDocencias(Set<ActividadDocencia> actividadDocencias) {
        this.actividadDocencias = actividadDocencias;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "profesor")
    public Set<OtrasActividades> getOtrasActividadeses() {
        return this.otrasActividadeses;
    }

    public void setOtrasActividadeses(Set<OtrasActividades> otrasActividadeses) {
        this.otrasActividadeses = otrasActividadeses;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "profesor")
    public Set<ObservacionesGenerales> getObservacionesGeneraleses() {
        return this.observacionesGeneraleses;
    }

    public void setObservacionesGeneraleses(Set<ObservacionesGenerales> observacionesGeneraleses) {
        this.observacionesGeneraleses = observacionesGeneraleses;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "profesor")
    public Set<Horario> getHorarios() {
        return this.horarios;
    }

    public void setHorarios(Set<Horario> horarios) {
        this.horarios = horarios;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "profesor")
    public Set<SeguimientoActividades> getSeguimientoActividadeses() {
        return this.seguimientoActividadeses;
    }

    public void setSeguimientoActividadeses(Set<SeguimientoActividades> seguimientoActividadeses) {
        this.seguimientoActividadeses = seguimientoActividadeses;
    }

}
