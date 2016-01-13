/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.naval.persistencia.hibernate;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author PAPEN
 */
public class SubirArchivo extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        response.setContentType("text/html;charset=UTF-8");
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new IllegalArgumentException("Request is not multipart, please 'multipart/form-data' enctype for your form.");
        }

        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
        PrintWriter writer = response.getWriter();

        response.setContentType("text/plain");
        String ultimoMatenimiento = (String) sesion.getAttribute("ultimaSolicitud");

        List<FileItem> items;
        try {
            items = uploadHandler.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {

                    FileItem actual = null;
                    actual = item;
                    String fileName = actual.getName();

                    String str = request.getSession().getServletContext().getRealPath("/adjuntos/");
                    fileName = ultimoMatenimiento + "-" + fileName;
                    // nos quedamos solo con el nombre y descartamos el path
                    File fichero = new File(str + "\\" + fileName);

                    try {
                        actual.write(fichero);
                        String aux = "{"
                                + "\"name\":\"" + fichero.getName()
                                + "\",\"size\":\"" + 2000
                                + "\",\"url\":\"/adjuntos/" + fichero.getName()
                                + "\",\"thumbnailUrl\":\"/thumbnails/" + fichero.getName()
                                + "\",\"deleteUrl\":\"/Subir?file=" + fichero.getName()
                                + "\",\"deleteType\":\"DELETE"
                                + "\",\"type\":\"" + fichero.getName() + "\"}";

                        writer.write("{\"files\":[" + aux + "]}");
                    } catch (Exception e) {
                    }
                }
            }
        } catch (Exception ex) {
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idSolicitud = request.getParameter("idSolicitud");
        if (idSolicitud == null) {
            processRequest(request, response);
        } else {
            PrintWriter writer = response.getWriter();
            response.setContentType("application/json;charset=UTF-8");

            try {
                String str = request.getSession().getServletContext().getRealPath("/adjuntos/");
                // nos quedamos solo con el nombre y descartamos el path
                File fichero = new File(str);

                String aux = "";
                for (File file : fichero.listFiles()) {
                    String elemento2[] = file.getName().split("-");

                    if (!aux.equals("")) {
                        if (elemento2[0].equals("" + idSolicitud)) {
                            aux += ",{\"name\":\"" + elemento2[1] + "\""
                                    + ",\"size\":\"" + file.length() + "\""
                                    + ",\"url\":\"/sac/adjuntos/" + file.getName() + "\""
                                    + "}";
                        }
                    } else if (elemento2[0].equals("" + idSolicitud)) {
                        aux += "{\"name\":\"" + elemento2[1] + "\""
                                + ",\"size\":\"" + file.length() + "\""
                                + ",\"url\":\"/sac/adjuntos/" + file.getName() + "\""
                                + "}";
                    }
                }
                writer.write("[" + aux + "]");

            } catch (Exception e) {

            } finally {
            }

        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
