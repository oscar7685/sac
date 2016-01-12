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
import javax.servlet.http.HttpSession;
import naval.dominio.Solicitud;
import naval.persistencia.dao.JsonTransformer;
import naval.persistencia.dao.SolicitudDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SolicitudController {

    @Autowired
    private SolicitudDAO solicitudDAO;

    @Autowired
    private JsonTransformer jsonTransformer;

    @RequestMapping(value = {"/Solicitud"}, method = RequestMethod.GET, produces = "application/json")
    public void find(HttpServletRequest httpRequest, HttpServletResponse httpServletResponse) throws IOException {
        try {
            List<Solicitud> a2 = solicitudDAO.findAll();
            String jsonUsuario = jsonTransformer.toJson(a2);
            httpServletResponse.setStatus(HttpServletResponse.SC_OK);
            httpServletResponse.setContentType("application/json; charset=UTF-8");
            httpServletResponse.getWriter().println(jsonUsuario);
        } catch (BussinessException ex) {
            Logger.getLogger(SolicitudController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @RequestMapping(value = "/Solicitud/{idSolicitud}", method = RequestMethod.GET, produces = "application/json")
    public void read(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @PathVariable("idSolicitud") int idSolicitud) {
        try {
            Solicitud a = solicitudDAO.get(idSolicitud);
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
                Logger.getLogger(SolicitudController.class.getName()).log(Level.SEVERE, null, ex1);
            }

        } catch (Exception ex) {
            httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

        }

    }

    @RequestMapping(value = "/Solicitud/{idSolicitud}", method = RequestMethod.PUT, consumes = "application/json", produces = "application/json")
    public void update(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestBody String jsonEntrada, @PathVariable("idSolicitud") int Solicitud) {
        try {
            Solicitud aux = (Solicitud) jsonTransformer.fromJson(jsonEntrada, Solicitud.class);
            solicitudDAO.saveOrUpdate(aux);
            //List<Mantenimiento> m = solicitudDAO.findLast("idmantenimiento");
            String jsonSalida = jsonTransformer.toJson(aux);

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
                Logger.getLogger(SolicitudController.class.getName()).log(Level.SEVERE, null, ex1);
            }

        } catch (Exception ex) {
            httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            httpServletResponse.setContentType("text/plain; charset=UTF-8");
            try {
                ex.printStackTrace(httpServletResponse.getWriter());
            } catch (IOException ex1) {
                Logger.getLogger(SolicitudController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    @RequestMapping(value = "/Solicitud", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    public void insert(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestBody String jsonEntrada) {
        try {
            Solicitud aux2 = (Solicitud) jsonTransformer.fromJson(jsonEntrada, Solicitud.class);
            solicitudDAO.saveOrUpdate(aux2);
           // List<Solicitud> m = solicitudDAO.findLast("idmantenimiento");
            String jsonSalida = jsonTransformer.toJson(aux2);
            /*HttpSession sesion = httpServletRequest.getSession();
            
            sesion.setAttribute("ultimoMatenimiento", ""+m.get(0).getIdmantenimiento());
            */
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
                Logger.getLogger(SolicitudController.class.getName()).log(Level.SEVERE, null, ex1);
            }

            
        } catch (Exception ex) {
            httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            httpServletResponse.setContentType("text/plain; charset=UTF-8");
            try {
                ex.printStackTrace(httpServletResponse.getWriter());
            } catch (IOException ex1) {
                Logger.getLogger(SolicitudController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }
}
