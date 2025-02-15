/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;
import phatnh.dto.BookDTO;
import phatnh.dto.LibraryDTO;

/**
 *
 * @author nguyenhongphat0
 */
@WebServlet(name = "MarshallToJavaScript", urlPatterns = {"/MarshallToJavaScript"})
public class MarshallToJavaScript extends HttpServlet {

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
            BookDTO book1 = new BookDTO();
            book1.setBooktitle("JAVA WEB");
            book1.setAuthor("ThanhPC");
            BookDTO book2 = new BookDTO();
            book2.setBooktitle("Java XML");
            book2.setAuthor("KhanhKT");
            LibraryDTO lib = new LibraryDTO();
            lib.getBook().add(book1);
            lib.getBook().add(book2);
            
            marshallerToTransfer(lib, response.getOutputStream());
        } catch (Exception e) {
        } finally {
            response.getOutputStream().close();
        }
    }
    
    private void marshallerToTransfer(LibraryDTO lib, OutputStream os) {
        try {
            JAXBContext jaxb = JAXBContext.newInstance(LibraryDTO.class);
            Marshaller ms = jaxb.createMarshaller();
            ms.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            ms.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");
            ms.marshal(lib, os);
        } catch (Exception e) {
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
