/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.utils;

import java.util.logging.Level;
import java.util.logging.Logger;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
import phatnh.daos.StudentDAO;
import phatnh.dtos.StudentDTO;

/**
 *
 * @author nguyenhongphat0
 */
public class CrawlStudentHandler extends DefaultHandler {
    private String currentTagName;
    private String fullname;
    private StudentDTO dto;
    private boolean isInsert;

    public CrawlStudentHandler() {
    }

    @Override
    public void startElement(String string, String string1, String string2, Attributes atrbts) throws SAXException {
        this.currentTagName = string2;
        if (string2.equals("student")) {
            dto = new StudentDTO();
            String id = atrbts.getValue("id");
            dto.setId(id);
        }
    }

    @Override
    public void characters(char[] chars, int i, int i1) throws SAXException {
        String str = new String(chars, i, i1);
        if (this.currentTagName.equals("lastname")) {
            this.fullname = str.trim();
        } else if (this.currentTagName.equals("middlename")) {
            this.fullname += " " + str.trim();
        } else if (this.currentTagName.equals("firstname")) {
            this.fullname += " " + str.trim();
            dto.setName(fullname);
        } else if (this.currentTagName.equals("password")) {
            dto.setPass(str);
        } else if (this.currentTagName.equals("status")) {
            if (!str.trim().equals("dropout")) {
                isInsert = true;
                dto.setStatus(str.trim());
            }
        }
    }

    @Override
    public void endElement(String string, String string1, String string2) throws SAXException {
        if (string2.equals("student")) {
            dto.setName(fullname);
            if (isInsert) {
                StudentDAO dao = new StudentDAO();
                try {
                    dao.insert(dto);
                } catch (Exception ex) {
                    Logger.getLogger(CrawlStudentHandler.class.getName()).log(Level.SEVERE, null, ex);
                }
                isInsert = false;
            }
        }
        this.currentTagName = "";
    }
}
