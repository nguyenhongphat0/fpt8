/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.utils;

import java.io.IOException;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

/**
 *
 * @author nguyenhongphat0
 */
public class XMLUtil implements Serializable {
    public static Document parseFileToDOM(String xmlFilePath) {
        try {
            DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
            DocumentBuilder db = dbf.newDocumentBuilder();
            Document doc = db.parse(xmlFilePath);
            return doc;
        } catch (SAXException | IOException | ParserConfigurationException ex) {
            ex.printStackTrace();
            return null;
        }
    }
    
    public static XPath getXPath() {
        XPathFactory factory = XPathFactory.newInstance();
        XPath xpath = factory.newXPath();
        return xpath;
    }
}
