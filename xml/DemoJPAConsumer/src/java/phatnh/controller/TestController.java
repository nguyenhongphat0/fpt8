/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.controller;

import dto.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import phatnh.client.TestClient;

/**
 *
 * @author nguyenhongphat0
 */
@WebServlet(name = "TestController", urlPatterns = {"/TestController"})
public class TestController extends HttpServlet {

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
        response.setContentType("text/xml;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet TestController</title>");            
//            out.println("</head>");
//            out.println("<body>");
            
            TestClient client = new TestClient();
//            Find ID
//            Product product = client.find_XML(Product.class, "3");
//            out.println(product.getName());
//            out.println(product.getLink());
            
//            Find All
//            List<Product> result = client.myFindAll_XML(List.class);
//            request.setAttribute("INFO", result);
//            request.getRequestDispatcher("show.jsp").forward(request, response);
            
//            Insert
//            Product product = new Product();
//            product.setName("Hoa hong den");
//            product.setPrice(123912398);
//            product.setLink("https://hongphat.hoahongden/asdf");
//            client.create_XML(product);

//            Update
//            Product product = new Product();
//            product.setName("Hoa hong den moi");
//            product.setPrice(300000000);
//            product.setLink("https://hongphat.com/hoahongden");
//            client.edit_XML(product, "13");
            
//            Delete
//            client.remove("13");
            
            String s = client.findAll_XML(String.class);
            out.println(s);
            
//            out.println("</body>");
//            out.println("</html>");
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
