/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package naval.persistencia.dao;

import com.naval.persistencia.dao.BussinessException;
import com.naval.persistencia.dao.GenericDAO;
import java.util.List;
import naval.dominio.Horario;

/**
 *
 * @author Oscar
 */
public interface HorarioDAO extends GenericDAO<Horario, Integer> {
    List<Horario> findHorarioC(int idcurso) throws BussinessException;
    List<Horario> findHorarioP(int idprofesor) throws BussinessException;
    List<Horario> findHorarioA(int idaula) throws BussinessException;
}
