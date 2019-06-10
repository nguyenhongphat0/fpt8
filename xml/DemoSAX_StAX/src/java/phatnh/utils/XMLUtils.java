/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.utils;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author nguyenhongphat0
 */
public class XMLUtils implements Serializable {
    public static void parseFileWithSAX(String filePath, DefaultHandler hanlder) {
        try {
            SAXParserFactory spf = SAXParserFactory.newInstance();
            File file = new File(filePath);
            SAXParser sax = spf.newSAXParser();
            sax.parse(file, hanlder);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
