/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package naval.presentacion;

import com.naval.persistencia.dao.BussinessException;
import com.naval.persistencia.dao.BussinessMessage;
import java.io.IOException;
import java.util.List;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import naval.dominio.Mantenimiento;
import naval.persistencia.dao.JsonTransformer;
import naval.persistencia.dao.MantenimientoDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MantenimientoController {

    @Autowired
    private MantenimientoDAO mantenimientoDAO;

    @Autowired
    private JsonTransformer jsonTransformer;

    @RequestMapping(value = {"/Mantenimiento"}, method = RequestMethod.GET, produces = "application/json")
    public void find(HttpServletRequest httpRequest, HttpServletResponse httpServletResponse) throws IOException {
        try {
            List<Mantenimiento> a2 = mantenimientoDAO.findAll();
            String jsonUsuario = jsonTransformer.toJson(a2);
            httpServletResponse.setStatus(HttpServletResponse.SC_OK);
            httpServletResponse.setContentType("application/json; charset=UTF-8");
            httpServletResponse.getWriter().println(jsonUsuario);
        } catch (BussinessException ex) {
            Logger.getLogger(MantenimientoController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @RequestMapping(value = "/Mantenimiento/{idMantenimiento}", method = RequestMethod.GET, produces = "application/json")
    public void read(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @PathVariable("idMantenimiento") int idMantenimiento) {
        try {
            Mantenimiento a = mantenimientoDAO.get(idMantenimiento);
            String jsonSalida = jsonTransformer.toJson(a);

            httpServletResponse.setStatus(HttpServletResponse.SC_OK);
            httpServletResponse.setContentType("application/json; charset=UTF-8");
            httpServletResponse.getWriter().println(jsonSalida);

        } catch (BussinessException ex) {
            Set<BussinessMessage> bussinessMessage = ex.getBussinessMessages();
            String jsonSalida = jsonTransformer.toJson(bussinessMessage);

            httpServletResponse.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            httpServletResponse.setContentType("application/json; charset=UTF-8");
            try {
                httpServletResponse.getWriter().println(jsonSalida);
            } catch (IOException ex1) {
                Logger.getLogger(MantenimientoController.class.getName()).log(Level.SEVERE, null, ex1);
            }

        } catch (Exception ex) {
            httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

        }

    }

    @RequestMapping(value = "/Mantenimiento/{idMantenimiento}", method = RequestMethod.PUT, consumes = "application/json", produces = "application/json")
    public void update(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestBody String jsonEntrada, @PathVariable("idMantenimiento") int idMantenimiento) {
        try {
            Mantenimiento aux = (Mantenimiento) jsonTransformer.fromJson(jsonEntrada, Mantenimiento.class);
            mantenimientoDAO.saveOrUpdate(aux);
            List<Mantenimiento> m = mantenimientoDAO.findLast("idmantenimiento");
            String jsonSalida = jsonTransformer.toJson(m.get(0));

            httpServletResponse.setStatus(HttpServletResponse.SC_OK);
            httpServletResponse.setContentType("application/json; charset=UTF-8");
            httpServletResponse.getWriter().println(jsonSalida);

        } catch (BussinessException ex) {
            Set<BussinessMessage> bussinessMessage = ex.getBussinessMessages();
            String jsonSalida = jsonTransformer.toJson(bussinessMessage);

            httpServletResponse.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            httpServletResponse.setContentType("application/json; charset=UTF-8");
            try {
                httpServletResponse.getWriter().println(jsonSalida);
            } catch (IOException ex1) {
                Logger.getLogger(MantenimientoController.class.getName()).log(Level.SEVERE, null, ex1);
            }

        } catch (Exception ex) {
            httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            httpServletResponse.setContentType("text/plain; charset=UTF-8");
            try {
                ex.printStackTrace(httpServletResponse.getWriter());
            } catch (IOException ex1) {
                Logger.getLogger(MantenimientoController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    @RequestMapping(value = "/Mantenimiento", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    public void insert(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestBody String jsonEntrada) {
        try {
            Mantenimiento aux2 = (Mantenimiento) jsonTransformer.fromJson(jsonEntrada, Mantenimiento.class);
            mantenimientoDAO.saveOrUpdate(aux2);
            List<Mantenimiento> m = mantenimientoDAO.findLast("idmantenimiento");
            String jsonSalida = jsonTransformer.toJson(m.get(0));
            
            httpServletResponse.setStatus(HttpServletResponse.SC_OK);
            httpServletResponse.setContentType("application/json; charset=UTF-8");
            httpServletResponse.getWriter().println(jsonSalida);
            
        } catch (BussinessException ex) {
            Set<BussinessMessage> bussinessMessage=ex.getBussinessMessages();
            String jsonSalida = jsonTransformer.toJson(bussinessMessage);
            
            httpServletResponse.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            httpServletResponse.setContentType("application/json; charset=UTF-8");
            try {
                httpServletResponse.getWriter().println(jsonSalida);
            } catch (IOException ex1) {
                Logger.getLogger(MantenimientoController.class.getName()).log(Level.SEVERE, null, ex1);
            }

            
        } catch (Exception ex) {
            httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            httpServletResponse.setContentType("text/plain; charset=UTF-8");
            try {
                ex.printStackTrace(httpServletResponse.getWriter());
            } catch (IOException ex1) {
                Logger.getLogger(MantenimientoController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }
}
