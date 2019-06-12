/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.utils;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 *
 * @author nguyenhongphat0
 */
public class StudentHandler extends DefaultHandler {
    private String username, password;
    private boolean foundUsername, foundPassword, found;
    private String currentTagName;
    private String fullName;
    private HttpServletResponse response;
    
    public StudentHandler(String username, String password, HttpServletResponse response) {
        this.username = username;
        this.password = password;
        this.response = response;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes atrbts) throws SAXException {
        this.currentTagName = qName;
        if (!found) {
            if (qName.equals("student")) {
                String id = atrbts.getValue("id");
                if (id.equals(username)) {
                    this.foundUsername = true;
                } else {
                    this.foundUsername = false;
                }
            }
        }
    }

    @Override
    public void characters(char[] chars, int i, int i1) throws SAXException {
        String str = new String(chars, i, i1);
        if (!found) {
            if (foundUsername) {
                if (this.currentTagName.equals("lastname")) {
                    this.fullName = str.trim();
                } else if (this.currentTagName.equals("middlename")) {
                    this.fullName += " " + str.trim();
                } else if (this.currentTagName.equals("firstname")) {
                    this.fullName += " " + str.trim();
                } else if (this.currentTagName.equals("password")) {
                    if (str.equals(password)) {
                        this.found = true;
                    } else {
                        this.found = false;
                    }
                }
            }
        }
    }

    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        if (found && qName.equals("firstname")) {
            System.out.println("Welcome " + fullName);
        }
    }
    
    public boolean getStatus() {
        return this.found;
    }

    public String getFullName() {
        return fullName;
    }
}
