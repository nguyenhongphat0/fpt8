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
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import phatnh.daos.XMLUtils;

/**
 *
 * @author nguyenhongphat0
 */
public class InsertController extends HttpServlet {
    private final String xmlFile = "/WEB-INF/studentAccount.xml";
    private static final String SUCCESS = "index.html";
    private static final String FAIL = "error.jsp";

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
        String url = FAIL;
        try {
            String id = request.getParameter("id");
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            String middlename = request.getParameter("middlename");
            String theclass = request.getParameter("class");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String status = request.getParameter("status");
            String realPath = getServletContext().getRealPath("/");
            String filePath = realPath + xmlFile;
            Document doc = XMLUtils.parseFileToDOM(filePath);
            if (doc != null) {
                Element student = doc.createElement("student");
                student.setAttribute("id", id);
                student.setAttribute("class", theclass);
                
                Element elLastname = doc.createElement("lastname");
                elLastname.setTextContent(lastname);
                student.appendChild(elLastname);
                Element elMiddlename = doc.createElement("middlename");
                elMiddlename.setTextContent(middlename);
                student.appendChild(elMiddlename);
                Element elFirstname = doc.createElement("firstname");
                elFirstname.setTextContent(firstname);
                student.appendChild(elFirstname);
                Element elAddress = doc.createElement("address");
                elAddress.setTextContent(address);
                student.appendChild(elAddress);
                Element elStatus = doc.createElement("status");
                elStatus.setTextContent(status);
                student.appendChild(elStatus);
                Element elPassword = doc.createElement("password");
                elPassword.setTextContent(password);
                student.appendChild(elPassword);
                
                NodeList listStudent = doc.getElementsByTagName("students");
                if (listStudent.getLength() > 0) {
                    listStudent.item(0).appendChild(student);
                    boolean rs = XMLUtils.transformDOMSrcToStreamResult(doc, filePath);
                    if (rs) {
                        url = SUCCESS;
                    }
                }
                
            }
        } catch (Exception e) {
            log("ERROR at InsertController: " + e.getMessage());
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
