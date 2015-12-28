/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package naval.persistencia.dao;

import com.naval.persistencia.dao.BussinessException;
import com.naval.persistencia.dao.GenericDAO;
import java.util.List;
import naval.dominio.Aula;

/**
 *
 * @author Oscar
 */
public interface AulaDAO extends GenericDAO<Aula, Integer> {

    List<Aula> findAulas() throws BussinessException;
}
