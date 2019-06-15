/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamConstants;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
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
    
    public static XMLStreamReader createStAXCursorReaderFromFile(String filePath) {
        XMLInputFactory xif = XMLInputFactory.newInstance();
        File f = new File(filePath);
        try {
            InputStream is = new FileInputStream(f);
            XMLStreamReader reader = xif.createXMLStreamReader(is);
            return reader;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public static String getTextContent(XMLStreamReader currentCursor, String tagName) throws XMLStreamException {
        if (currentCursor != null) {
            while (currentCursor.hasNext()) {                
                int cursor = currentCursor.next();
                if (cursor == XMLStreamConstants.START_ELEMENT) {
                    String name = currentCursor.getLocalName();
                    if (name.equals(tagName)) {
                        currentCursor.next();
                        String result = currentCursor.getText();
                        currentCursor.nextTag();
                        return result;
                    }
                }
            }
        }
        return null;
    }
}
