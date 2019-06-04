/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import phatnh.daos.XMLUtils;

/**
 *
 * @author nguyenhongphat0
 */
public class LoginController extends HttpServlet {
    private final String xmlFile = "/WEB-INF/studentAccount.xml";
    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "search.jsp";
    private String fullname = "";
    private boolean found = false;

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
        String url = ERROR;
        this.found = false;
        this.fullname = "";
        try {
            String username = request.getParameter("txtUsername");
            String password = request.getParameter("txtPassword");
            String realPath = getServletContext().getRealPath("/");
            String filePath = realPath + xmlFile;
            Document doc = XMLUtils.parseFileToDOM(filePath);
            checkLogin(doc, username, password);
            if (found) {
                url = SUCCESS;
                HttpSession session = request.getSession();
                session.setAttribute("USER", fullname);
            }
        } catch (Exception e) {
            log("ERROR at LoginController: " + e.getMessage());
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

    private void checkLogin(Node node, String username, String password) {
        if (node == null || found) {
            return;
        }
        NodeList childrens = node.getChildNodes();
        if (node.getNodeName().equals("student")) {
            String id = node.getAttributes().getNamedItem("id").getNodeValue();
            if (id.equals(username)) {
                for (int i = 0; i < childrens.getLength(); i++) {
                    Node tmp = childrens.item(i);
                    if (tmp.getNodeName().equals("lastname")) {
                        fullname += tmp.getTextContent().trim() + " ";
                    } else if (tmp.getNodeName().equals("middlename")) {
                        fullname += tmp.getTextContent().trim() + " ";
                    } else if (tmp.getNodeName().equals("firstname")) {
                        fullname += tmp.getTextContent().trim();
                    } else if (tmp.getNodeName().equals("password")) {
                        String pass = tmp.getTextContent().trim();
                        if (!pass.equals(password)) {
                            break;
                        }
                    } else if (tmp.getNodeName().equals("status")) {
                        String status = tmp.getTextContent().trim();
                        if (!status.equals("dropout")) {
                            found = true;
                            return;
                        }
                    }
                }
            }
        }
        for (int i = 0; i < childrens.getLength(); i++) {
            checkLogin(childrens.item(i), username, password);
        }
    }

}
