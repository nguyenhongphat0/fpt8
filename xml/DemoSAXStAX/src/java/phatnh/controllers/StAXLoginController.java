/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import phatnh.utils.XMLUtils;

/**
 *
 * @author nguyenhongphat0
 */
@WebServlet(name = "StAXLoginController", urlPatterns = {"/StAXLoginController"})
public class StAXLoginController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String url = "error.jsp";
        try {
            String filePath = getServletContext().getRealPath("/") + "WEB-INF/studentAccount.xml";
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String fullname = "";
            boolean found = false;
            XMLStreamReader reader = XMLUtils.createStAXCursorReaderFromFile(filePath);
            while (reader.hasNext()) {
                int cursor = reader.next();
                if (cursor == XMLStreamConstants.START_ELEMENT) {
                    String tagName = reader.getLocalName();
                    if (tagName.equals("student")) {
                        String id = reader.getAttributeValue("", "id");
                        if (id.equals(username)) {
                            fullname = XMLUtils.getTextContent(reader, "lastname")
                                    + " " + XMLUtils.getTextContent(reader, "middlename")
                                    + " " + XMLUtils.getTextContent(reader, "firstname");
                            String pass = XMLUtils.getTextContent(reader, "password");
                            if (pass.trim().equals(password)) {
                                String status = XMLUtils.getTextContent(reader, "status");
                                if (!status.trim().equals("dropout")) {
                                    found = true;
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            if (found) {
                url = "search.jsp";
                HttpSession session = request.getSession();
                session.setAttribute("FULLNAME", fullname);
            }
        } catch (XMLStreamException ex) {
            Logger.getLogger(StAXLoginController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
