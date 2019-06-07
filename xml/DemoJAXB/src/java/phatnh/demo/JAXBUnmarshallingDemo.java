/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.demo;

import java.io.File;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

/**
 *
 * @author nguyenhongphat0
 */
public class JAXBUnmarshallingDemo {
    public static void main(String[] args) throws JAXBException {
        JAXBContext jc = JAXBContext.newInstance(Customer.class);
        Unmarshaller um = jc.createUnmarshaller();
        File f = new File("web/WEB-INF/customers.xml");
        Customer item = (Customer) um.unmarshal(f);
        System.out.println("ID = " + item.getCustomerid());
        System.out.println("Name = " + item.getName());
    }
}
