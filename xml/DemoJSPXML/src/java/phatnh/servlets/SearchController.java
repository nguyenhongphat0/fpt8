/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import phatnh.dto.StudentDTO;
import phatnh.utils.XMLUtil;

/**
 *
 * @author nguyenhongphat0
 */
@WebServlet(name = "SearchController", urlPatterns = {"/SearchController"})
public class SearchController extends HttpServlet {
    private final String xmlFile = "/WEB-INF/studentAccount.xml";
    private final String showPage = "index.jsp";
    

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
        try {
            ServletContext context = this.getServletContext();
            Document doc = (Document) context.getAttribute("DOMTREE");
            String search = request.getParameter("search");
            if (doc == null) {
                String realPath = this.getServletContext().getRealPath("/");
                String xmlPath = realPath + xmlFile;
                doc = XMLUtil.parseFileToDOM(xmlPath);
                context.setAttribute("DOMTREE", doc);
            } else {
                XPath xpath = XMLUtil.getXPath();
                String exp = "//student[contains(address, '" + search + "')]";
                NodeList students = (NodeList) xpath.evaluate(exp, doc, XPathConstants.NODESET);
                List<StudentDTO> result = new ArrayList<>();
                for (int i = 0; i < students.getLength(); i++) {
                    Node tmp = students.item(i);
                    exp = "@id";
                    String id = (String) xpath.evaluate(exp, tmp, XPathConstants.STRING);
                    exp = "@class";
                    String sclass = (String) xpath.evaluate(exp, tmp, XPathConstants.STRING);
                    exp = "lastname";
                    String lastname = (String) xpath.evaluate(exp, tmp, XPathConstants.STRING);
                    exp = "middlename";
                    String middlename = (String) xpath.evaluate(exp, tmp, XPathConstants.STRING);
                    exp = "firstname";
                    String firstname = (String) xpath.evaluate(exp, tmp, XPathConstants.STRING);
                    exp = "sex";
                    String sex = (String) xpath.evaluate(exp, tmp, XPathConstants.STRING);
                    exp = "address";
                    String address = (String) xpath.evaluate(exp, tmp, XPathConstants.STRING);
                    exp = "status";
                    String status = (String) xpath.evaluate(exp, tmp, XPathConstants.STRING);
                    StudentDTO dto = new StudentDTO(id, sclass, lastname, middlename, firstname, sex, address, status);
                    result.add(dto);
                }
                request.setAttribute("INFO", result);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(showPage).forward(request, response);
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
