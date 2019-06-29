/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import org.apache.fop.apps.FOUserAgent;
import org.apache.fop.apps.Fop;
import org.apache.fop.apps.FopFactory;
import org.apache.fop.apps.MimeConstants;

/**
 *
 * @author nguyenhongphat0
 */
@WebServlet(name = "ConvertToPDFController", urlPatterns = {"/ConvertToPDFController"})
public class ConvertToPDFController extends HttpServlet {

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
            String search = request.getParameter("txtSearch");
            String sql = "SELECT UserName as username, Email as fullname, Id as role FROM Account "
                    + "WHERE fullname LIKE ? FOR XML PATH('account'), Root('accounts')";
            String sqlConnection = "jdbc:sqlserver://localhost:1433;databaseName=Duhaanph";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection con = DriverManager.getConnection(sqlConnection, "sa", "hongphat")) {
                PreparedStatement pre = con.prepareStatement(sql);
                pre.setString(1, "%" + search + "%");
                try (ResultSet res = pre.executeQuery()) {
                    if (res.next()) {
                        String str = res.getString(1);
                        String path = getServletContext().getRealPath("/");
                        String xslPath = path + "/WEB-INF/accountFO.xsl";
                        String foPath = path + "/WEB-INF/accountFO.fo";
                        methodTrAX(xslPath, str, foPath, path);
                        ByteArrayOutputStream out = new ByteArrayOutputStream();
                        response.setContentType("application/pdf");
                        FopFactory ff = FopFactory.newInstance();
                        ff.setUserConfig(path + "/WEB-INF/config.xml");
                        FOUserAgent fua = ff.newFOUserAgent();
                        Fop fop = ff.newFop(MimeConstants.MIME_PDF, fua, out);

                        TransformerFactory tff = TransformerFactory.newInstance();
                        Transformer trans = tff.newTransformer();
                        File fo = new File(foPath);
                        Source src = new StreamSource(fo);
                        Result result = new SAXResult(fop.getDefaultHandler());
                        trans.transform(src, result);

                        byte[] content = out.toByteArray();
                        response.setContentLength(content.length);
                        response.getOutputStream().write(content);
                        response.getOutputStream().flush();
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void methodTrAX(String xslPath, String xmlString, String output, String path) {
        try {
            TransformerFactory tf = TransformerFactory.newInstance();
            StreamSource xslFile = new StreamSource(xslPath);
            Transformer trans = tf.newTransformer(xslFile);
            trans.setParameter("pathFile", path);
            InputStream is = new ByteArrayInputStream(xmlString.getBytes(StandardCharsets.UTF_8));
            StreamSource xmlFile = new StreamSource(is);
            StreamResult htmlFile = new StreamResult(new FileOutputStream(output));
            trans.transform(xmlFile, htmlFile);
        } catch (Exception e) {
            e.printStackTrace();
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
