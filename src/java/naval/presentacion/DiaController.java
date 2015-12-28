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
import naval.dominio.Dias;
import naval.persistencia.dao.DiasDAO;
import naval.persistencia.dao.JsonTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DiaController {

    @Autowired
    private DiasDAO diasDAO;
    @Autowired
    private JsonTransformer jsonTransformer;

    @RequestMapping(value = {"/Dias"}, method = RequestMethod.GET, produces = "application/json")
    public void find(HttpServletRequest httpRequest, HttpServletResponse httpServletResponse) throws IOException {
        try {
            List<Dias> a2 = diasDAO.findAll();
            String jsonUsuario = jsonTransformer.toJson(a2);
            httpServletResponse.setStatus(HttpServletResponse.SC_OK);
            httpServletResponse.setContentType("application/json; charset=UTF-8");
            httpServletResponse.getWriter().println(jsonUsuario);
        } catch (BussinessException ex) {
            Logger.getLogger(DiaController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @RequestMapping(value = "/Dias/{idDia}", method = RequestMethod.GET, produces = "application/json")
    public void read(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @PathVariable("idDia") int idDia) {
        try {
            Dias a = diasDAO.get(idDia);
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
                Logger.getLogger(DiaController.class.getName()).log(Level.SEVERE, null, ex1);
            }

        } catch (Exception ex) {
            httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

        }

    }

    @RequestMapping(value = "/Dias/{idDia}", method = RequestMethod.PUT, consumes = "application/json", produces = "application/json")
    public void update(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestBody String jsonEntrada, @PathVariable("idAula") int idAula) {
        try {
            Dias aux = (Dias) jsonTransformer.fromJson(jsonEntrada, Dias.class);
            diasDAO.saveOrUpdate(aux);
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
                Logger.getLogger(DiaController.class.getName()).log(Level.SEVERE, null, ex1);
            }

        } catch (Exception ex) {
            httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            httpServletResponse.setContentType("text/plain; charset=UTF-8");
            try {
                ex.printStackTrace(httpServletResponse.getWriter());
            } catch (IOException ex1) {
                Logger.getLogger(DiaController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    @RequestMapping(value = "/Dias", method = RequestMethod.POST, consumes = "application/json", produces = "application/json")
    public void insert(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, @RequestBody String jsonEntrada) {
        try {
            Dias aux2 = (Dias) jsonTransformer.fromJson(jsonEntrada, Dias.class);
            diasDAO.saveOrUpdate(aux2);
            String jsonSalida = jsonTransformer.toJson(aux2);

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
                Logger.getLogger(DiaController.class.getName()).log(Level.SEVERE, null, ex1);
            }


        } catch (Exception ex) {
            httpServletResponse.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            httpServletResponse.setContentType("text/plain; charset=UTF-8");
            try {
                ex.printStackTrace(httpServletResponse.getWriter());
            } catch (IOException ex1) {
                Logger.getLogger(DiaController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }
}
