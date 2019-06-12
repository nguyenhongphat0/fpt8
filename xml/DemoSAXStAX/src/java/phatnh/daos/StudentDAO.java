/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phatnh.daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import phatnh.dtos.StudentDTO;

/**
 *
 * @author nguyenhongphat0
 */
public class StudentDAO {
    public StudentDAO() {
        
    }
    
    public boolean insert(StudentDTO dto) throws Exception {
        boolean check = false;
        String sql = "INSERT INTO Registration(Username, Password, Fullname, Role) VALUES (?, ?, ?, ?)";
        String connectionString = "jdbc:mysql://localhost:3306/prxdemo";
        String username = "root";
        String password = "hongphat";
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection(connectionString, username, password);
        PreparedStatement preStm = conn.prepareStatement(sql);
        preStm.setString(1, dto.getId());
        preStm.setString(2, dto.getPass());
        preStm.setString(3, dto.getName());
        preStm.setString(4, dto.getStatus());
        check = preStm.executeUpdate() > 0;
        return check;
    }
}
