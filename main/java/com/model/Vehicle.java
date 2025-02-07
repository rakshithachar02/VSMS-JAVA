package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import jakarta.servlet.http.HttpSession;
import com.model.Mechanic;


public class Vehicle {
	private HttpSession se;
	private Connection con;
	public Vehicle(HttpSession session) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/vsms", "root", "tiger");
			se = session;
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
    public String Registration(String name,  String email, String phone, String pw) {
    	  PreparedStatement ps;
          String status = "";
    	
          try {
              Statement st = null;
              ResultSet rs = null; 
              st = con.createStatement();
              rs = st.executeQuery("select * from register where contact='" + phone + "' or email='" + email + "';");
              boolean b = rs.next();
              if (b) {
                  status = "existed";
              } else {
                  ps = (PreparedStatement) con.prepareStatement("insert into register values(0,?,?,?,?)");
                  ps.setString(1, name);
                  ps.setString(2, email);
                  ps.setString(3, phone);
                  ps.setString(4, pw);
                  int a = ps.executeUpdate(); 
                  if (a > 0) {
                      status = "success";
                  } else {
                      status = "failure";
                  }
              }

          } catch (Exception e) {
              e.printStackTrace();
          }
    	return status;
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
                se.setAttribute("uname", name);
                se.setAttribute("email", emails);
                se.setAttribute("id", id);
                if(id == 1)
                	status = "success";
                else
                	status = "success1";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public String addMechanic(String name, String contact, String email, int status1) {
    	PreparedStatement ps;
		String status = "";
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from mechanic_list where contact='" + contact + "' or email='" + email + "';");
			boolean b = rs.next();
			if (b)
				status = "existed";
			else {
				ps = (PreparedStatement) con.prepareStatement("insert into mechanic_list values (0,?,?,?,?,now())");
				ps.setString(1, name);
				ps.setString(2, contact);
				ps.setString(3, email);
				ps.setInt(4, status1);
				
				int a = ps.executeUpdate();
				if (a > 0)
					status = "success";
				else
					status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
    }
    
    public ArrayList<Mechanic> getMechanicList() {
		ArrayList<Mechanic> al = new ArrayList<Mechanic>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from mechanic_list;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Mechanic m = new Mechanic(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				m.setId(rs.getInt("id"));
				m.setName(rs.getString("name"));
				m.setContact(rs.getString("contact"));
				m.setEmail(rs.getString("email"));
				m.setStatus(rs.getInt("status"));
				m.setDate_created(rs.getString("date_created"));
				
				al.add(m);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
    
    public Mechanic getMechanicInfo(int id) {
		
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from mechanic_list where "+ "id='" + id + "'";
			rs = st.executeQuery(qry);
			if (rs.next()) {
				Mechanic m = new Mechanic(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				m.setId(rs.getInt("id"));
				m.setName(rs.getString("name"));
				m.setContact(rs.getString("contact"));
				m.setEmail(rs.getString("email"));
				m.setStatus(rs.getInt("status"));
				m.setDate_created(rs.getString("date_created"));
				return m;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
    
    public String updateMechanic(int id, String name, String contact, String email, int status1) {
        String status = "";
        Statement st = null;
        int res = 0;
        try {
            st = con.createStatement();
            res = st.executeUpdate("update mechanic_list set name='" + name + "',contact='" + contact + "',email='" + email + "',status='" + status1 + "' where id= '" + id + "' ");
            if (res > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }

        return status;
    }
    
    public String deleteMechanic(int id) {
        int res = 0;
        Statement st = null;
        String status = "";
        try {
            st = con.createStatement();
            res = st.executeUpdate("delete from mechanic_list where "+ "id='" + id + "'");
            if (res > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public ArrayList<Category> getCategoryList() {
		ArrayList<Category> al = new ArrayList<Category>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from category_list;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Category c = new Category(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				c.setId(rs.getInt("id"));
				c.setCategory(rs.getString("category"));
				c.setStatus(rs.getInt("status"));
				c.setDate_created(rs.getString("date_created"));
				
				al.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
    
    public String addCategory(String category, int status1) {
    	PreparedStatement ps;
		String status = "";
		
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from category_list where category='" + category + "';");
			boolean b = rs.next();
			if (b)
				status = "existed";
			else {
				ps = (PreparedStatement) con.prepareStatement("insert into category_list values (0,?,?,now())");
				ps.setString(1, category);
				ps.setInt(2, status1);
				
				int a = ps.executeUpdate();
				if (a > 0)
					status = "success";
				else
					status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
    }
    
    public Category getCategoryInfo(int id) {
		
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from category_list where "+ "id='" + id + "'";
			rs = st.executeQuery(qry);
			if (rs.next()) {
				Category c = new Category(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				c.setId(rs.getInt("id"));
				c.setCategory(rs.getString("category"));
				c.setStatus(rs.getInt("status"));
				c.setDate_created(rs.getString("date_created"));
				return c;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
    
    public String updateCategory(int id, String category, int status1) {
        String status = "";
        Statement st = null;
        int res = 0;
        try {
            st = con.createStatement();
            res = st.executeUpdate("update category_list set category='" + category + "',status='" + status1 + "' where id= '" + id + "' ");
            if (res > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }

        return status;
    }
    
    public String deleteCategory(int id) {
        int res = 0;
        Statement st = null;
        String status = "";
        try {
            st = con.createStatement();
            res = st.executeUpdate("delete from category_list where "+ "id='" + id + "'");
            if (res > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public ArrayList<Service> getServiceList() {
		ArrayList<Service> al = new ArrayList<Service>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from service_list;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				Service s = new Service(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				s.setId(rs.getInt("id"));
				s.setService(rs.getString("service"));
				s.setDescription(rs.getString("description"));
				s.setStatus(rs.getInt("status"));
				s.setDate_created(rs.getString("date_created"));
				
				al.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
    
    public String addService(String service, String description, int status1) {
    	PreparedStatement ps;
		String status = "";
		
		try {
			Statement st = null;
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery("select * from service_list where service='" + service + "';");
			boolean b = rs.next();
			if (b)
				status = "existed";
			else {
				ps = (PreparedStatement) con.prepareStatement("insert into service_list values (0,?,?,?,now())");
				ps.setString(1, service);
				ps.setString(2, description);
				ps.setInt(3, status1);
				
				int a = ps.executeUpdate();
				if (a > 0)
					status = "success";
				else
					status = "failure";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
    }
    
    public Service getServiceInfo(int id) {
		
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from service_list where "+ "id='" + id + "'";
			rs = st.executeQuery(qry);
			if (rs.next()) {
				Service s = new Service(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				s.setId(rs.getInt("id"));
				s.setService(rs.getString("service"));
				s.setDescription(rs.getString("description"));
				s.setStatus(rs.getInt("status"));
				s.setDate_created(rs.getString("date_created"));
				return s;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
    
    public String updateService(int id, String service, String description, int status1) {
        String status = "";
        Statement st = null;
        int res = 0;
        try {
            st = con.createStatement();
            res = st.executeUpdate("update service_list set service='" + service + "', description='" + description + "', status='" + status1 + "' where id='" + id + "' ");
            if (res > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }

        return status;
    }
    
    public String deleteService(int id) {
        int res = 0;
        Statement st = null;
        String status = "";
        try {
            st = con.createStatement();
            res = st.executeUpdate("delete from service_list where "+ "id='" + id + "'");
            if (res > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public String addServiceRequest(String category, String vName, String oName, String regNo, String contact, String model, String email, String service, String address, String rType, String pAddress, String mechanic, int status1) {
    	PreparedStatement ps;
		String status = "";
		try {
				ps = (PreparedStatement) con.prepareStatement("insert into service_request values (0,?,?,?,?,?,?,?,?,?,?,?,?,?,now())");
				ps.setString(1, category);
				ps.setString(2, vName);
				ps.setString(3, oName);
				ps.setString(4, regNo);
				ps.setString(5, contact);
				ps.setString(6, model);
				ps.setString(7, email);
				ps.setString(8, service);
				ps.setString(9, address);
				ps.setString(10, rType);
				ps.setString(11, pAddress);
				ps.setString(12, mechanic);				
				ps.setInt(13, status1);
				
				int a = ps.executeUpdate();
				if (a > 0)
					status = "success";
				else
					status = "failure";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
    }
    
    public ArrayList<ServiceRequest> getServiceRequest() {
		ArrayList<ServiceRequest> al = new ArrayList<ServiceRequest>();
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from service_request;";
			rs = st.executeQuery(qry);
			while (rs.next()) {
				ServiceRequest sr = new ServiceRequest(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				sr.setId(rs.getInt("id"));
				sr.setCategory(rs.getString("category"));
				sr.setvName(rs.getString("vehicleName"));
				sr.setoName(rs.getString("ownerName"));
				sr.setRegNo(rs.getString("vehicleRegNo"));
				sr.setContact(rs.getString("ownerContact"));
				sr.setModel(rs.getString("vehicleModel"));
				sr.setEmail(rs.getString("ownerEmail"));
				sr.setService(rs.getString("service"));
				sr.setAddress(rs.getString("ownerAddress"));
				sr.setrType(rs.getString("serviceType"));
				sr.setpAddress(rs.getString("pickupAddress"));
				sr.setMechanic(rs.getString("mechanic"));
				sr.setStatus(rs.getInt("status"));
				sr.setDate_created(rs.getString("date_created"));
				
				al.add(sr);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return al;
	}
    
    public ServiceRequest getServiceRequestInfo(int id) {
		
		try {
			ResultSet rs = null;
			Statement st = null;
			st = con.createStatement();
			String qry = " select * from service_request where "+ "id='" + id + "'";
			rs = st.executeQuery(qry);
			if (rs.next()) {
				ServiceRequest sr = new ServiceRequest(); // 1..r---db 2.. pass the data or value to Dproduct class set method
				sr.setId(rs.getInt("id"));
				sr.setCategory(rs.getString("category"));
				sr.setvName(rs.getString("vehicleName"));
				sr.setoName(rs.getString("ownerName"));
				sr.setRegNo(rs.getString("vehicleRegNo"));
				sr.setContact(rs.getString("ownerContact"));
				sr.setModel(rs.getString("vehicleModel"));
				sr.setEmail(rs.getString("ownerEmail"));
				sr.setService(rs.getString("service"));
				sr.setAddress(rs.getString("ownerAddress"));
				sr.setrType(rs.getString("serviceType"));
				sr.setpAddress(rs.getString("pickupAddress"));
				sr.setMechanic(rs.getString("mechanic"));
				sr.setStatus(rs.getInt("status"));
				sr.setDate_created(rs.getString("date_created"));
				return sr;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
    
    public String updateServiceRequest(int id, String category, String vName, String oName, String regNo, String contact, String model, String email, String service, String address, String rType, String pAddress, String mechanic, int status1) {
        String status = "";
        Statement st = null;
        int res = 0;
        try {
            st = con.createStatement();
            res = st.executeUpdate("update service_request set category='" + category + "',vehicleName='" + vName + "',ownerName='" + oName + "',vehicleRegNo='" + regNo + "',ownerContact='" + contact + "',vehicleModel='" + model + "',ownerEmail='" + email + "',service='" + service + "',ownerAddress='" + address + "',serviceType='" + rType + "',pickupAddress='" + pAddress + "',mechanic='" + mechanic + "',status='" + status1 + "' where id= '" + id + "' ");
            if (res > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }

        return status;
    }
    
    public String deleteServiceRequest(int id) {
        int res = 0;
        Statement st = null;
        String status = "";
        try {
            st = con.createStatement();
            res = st.executeUpdate("delete from service_request where "+ "id='" + id + "'");
            if (res > 0) {
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
