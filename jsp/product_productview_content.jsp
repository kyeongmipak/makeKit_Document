<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
    	String productno = request.getParameter("productno");

	String url_mysql = "jdbc:mysql://localhost/makekit?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
   	
    int count = 0;

 PreparedStatement ps = null;
    ResultSet rs =null;
    
 try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn_mysql = DriverManager.getConnection(url_mysql, id_mysql, pw_mysql);
        Statement stmt_mysql = conn_mysql.createStatement();

       String query = "select productNo, productName, productPrice, productContent, productFilename, productDFilename, ";
	String query1 = "productAFilename from product where productNo = ?";

        ps = conn_mysql.prepareStatement(query + query1); // 
        ps.setString(1, productno);

        rs = ps.executeQuery();
%>
		{ 
  			"product_info"  : [ 
<%
        while (rs.next()) {
            if (count == 0) {

            }else{
%>
            , 
<%
            }
%>            
			{
			"productNo" : "<%=rs.getString(1) %>", 
			"productName" : "<%=rs.getString(2) %>", 
			"productPrice" : "<%=rs.getString(3) %>", 
			"productContent" : "<%=rs.getString(4) %>",   
			"productFilename" : "<%=rs.getString(5) %>",
			"productDFilename" : "<%=rs.getString(6) %>",
			"productAFilename" : "<%=rs.getString(7) %>"
		
			}

<%		
        count++;
        }
%>
		  ] 
		} 
<%		
        conn_mysql.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
	
%>