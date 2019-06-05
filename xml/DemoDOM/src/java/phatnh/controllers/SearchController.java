/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import phatnh.daos.XMLUtils;
import phatnh.dtos.StudentDTO;

/**
 *
 * @author nguyenhongphat0
 */
public class SearchController extends HttpServlet {
    private final String xmlFile = "/WEB-INF/studentAccount.xml";
    private static final String SUCCESS = "search.jsp";
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
        try {
            String search = request.getParameter("searchTxt");
            String realPath = getServletContext().getRealPath("/");
            String filePath = realPath + xmlFile;
            
            Document doc = XMLUtils.parseFileToDOM(filePath);
            if (doc != null) {
                XPath xpath = XMLUtils.createXPath();
                String exp = "//student[contains(address,'" + search + "')]";
                NodeList studentList = (NodeList) xpath.evaluate(exp, doc, XPathConstants.NODESET);
                if (studentList != null) {
                    List<StudentDTO> list = new ArrayList<StudentDTO>();
                    for (int i = 0; i < studentList.getLength(); i++) {
                        Node node = studentList.item(i);
                        StudentDTO dto = new StudentDTO();
                        dto.setId(node.getAttributes().getNamedItem("id").getNodeValue());
                        NodeList children = node.getChildNodes();
                        for (int j = 0; j < children.getLength(); j++) {
                            Node tmp = children.item(j);
                            if (tmp.getNodeName().equals("firstname")) {
                                dto.setFirstname(tmp.getTextContent().trim());
                            } else if (tmp.getNodeName().equals("lastname")) {
                                dto.setLastname(tmp.getTextContent().trim());
                            } else if (tmp.getNodeName().equals("middlename")) {
                                dto.setMiddlename(tmp.getTextContent().trim());
                            } else if (tmp.getNodeName().equals("address")) {
                                dto.setAddress(tmp.getTextContent().trim());
                            } else if (tmp.getNodeName().equals("status")) {
                                dto.setStatus(tmp.getTextContent().trim());
                            }
                        }
                        list.add(dto);
                    }
                    request.setAttribute("INFO", list);
                }
            }
        } catch (Exception e) {
            log("ERROR at SearchController: " + e.getMessage());
        } finally {
            request.getRequestDispatcher(SUCCESS).forward(request, response);
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
