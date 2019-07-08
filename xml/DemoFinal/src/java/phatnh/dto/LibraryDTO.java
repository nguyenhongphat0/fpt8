/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.dto;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

/**
 *
 * @author nguyenhongphat0
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "bookDTO", propOrder = {"book"})
@XmlRootElement(name = "libraryDTO")
public class LibraryDTO {
    @XmlElement(required = true)
    protected List<BookDTO> book;
    
    public List<BookDTO> getBook() {
        if (book == null) {
            book = new ArrayList<>();
        }
        return book;
    }
}
