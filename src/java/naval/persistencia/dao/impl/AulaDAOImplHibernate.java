/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package naval.persistencia.dao.impl;

import com.naval.persistencia.dao.BussinessException;
import naval.persistencia.dao.AulaDAO;
import com.naval.persistencia.dao.impl.GenericDAOImplHibernate;
import com.naval.persistencia.hibernate.HibernateUtil;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import naval.dominio.Aula;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Oscar
 */
public class AulaDAOImplHibernate extends GenericDAOImplHibernate<Aula, Integer> implements AulaDAO {

    private final static Logger LOGGER = Logger.getLogger(AulaDAOImplHibernate.class.getName());
    SessionFactory sessionFactory;
    
     public AulaDAOImplHibernate() {
        sessionFactory=HibernateUtil.getSessionFactory();
    }
    
    
    @Override
    public List<Aula> findAulas() throws BussinessException {
        Session session = sessionFactory.getCurrentSession();
        try {

            Query query = session.createQuery("SELECT e FROM Aula e LEFT JOIN FETCH e.edificio");
            List<Aula> entities = query.list();

            return entities;
        } catch (javax.validation.ConstraintViolationException cve) {
            try {
                if (session.getTransaction().isActive()) {
                    session.getTransaction().rollback();
                }
            } catch (Exception exc) {
                LOGGER.log(Level.WARNING, "Falló al hacer un rollback", exc);
            }
            throw new BussinessException(cve);
        } catch (org.hibernate.exception.ConstraintViolationException cve) {
            try {
                if (session.getTransaction().isActive()) {
                    session.getTransaction().rollback();
                }
            } catch (Exception exc) {
                LOGGER.log(Level.WARNING, "Falló al hacer un rollback", exc);
            }
            throw new BussinessException(cve);
        } catch (RuntimeException ex) {
            try {
                if (session.getTransaction().isActive()) {
                    session.getTransaction().rollback();
                }
            } catch (Exception exc) {
                LOGGER.log(Level.WARNING, "Falló al hacer un rollback", exc);
            }
            throw ex;
        } catch (Exception ex) {
            try {
                if (session.getTransaction().isActive()) {
                    session.getTransaction().rollback();
                }
            } catch (Exception exc) {
                LOGGER.log(Level.WARNING, "Falló al hacer un rollback", exc);
            }
            throw new RuntimeException(ex);
        }

    }

}
