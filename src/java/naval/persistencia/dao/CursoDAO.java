/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package naval.persistencia.dao;

import com.naval.persistencia.dao.BussinessException;
import com.naval.persistencia.dao.GenericDAO;
import java.util.List;
import naval.dominio.Curso;

/**
 *
 * @author Oscar
 */
public interface CursoDAO extends GenericDAO<Curso, Integer> {

    List<Curso> findCursosBase() throws BussinessException;
}
