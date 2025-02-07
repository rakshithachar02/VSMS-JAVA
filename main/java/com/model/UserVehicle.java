package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.http.HttpSession;

public class UserVehicle {
	private HttpSession use;
	private Connection con;
	public UserVehicle(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsms", "root", "tiger");
			use = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String login(String email, String pass) {
        String status = ""; int id;
        String name = "", emails = "";

        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            
            rs = st.executeQuery("select * from register where email='" + email + "' and password='" + pass + "';");
            boolean b = rs.next();
            if (b == true) {
                id = rs.getInt("id");
                name = rs.getString("name");
                emails = rs.getString("email");
                use.setAttribute("cname", name);
                use.setAttribute("cemail", emails);
                use.setAttribute("cid", id);
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}
