/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import org.w3c.dom.Document;
import phatnh.utils.XMLUtil;

/**
 * Web application lifecycle listener.
 *
 * @author nguyenhongphat0
 */
public class MyContextServletListener implements ServletContextListener {
    private final String xmlFile = "WEB-INF/studentAccount.xml";
    

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Deploying");
        ServletContext context = sce.getServletContext();
        String realPath = context.getRealPath("/");
        String xmlFilePath = realPath + xmlFile;
        Document doc = XMLUtil.parseFileToDOM(xmlFilePath);
        if (doc != null) {
            context.setAttribute("DOMTREE", doc);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println("Bye bye");
    }
}
