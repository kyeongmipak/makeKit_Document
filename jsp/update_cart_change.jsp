<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String cartno = request.getParameter("cartno");
	String productno = request.getParameter("productno");
	String cartquantity = request.getParameter("cartquantity");
	

	String url_mysql = "jdbc:mysql://localhost/makekit?serverTimezone=Asia/Seoul&characterEncoding=utf8&useSSL=false";
 	String id_mysql = "root";
 	String pw_mysql = "qwer1234";
   	
    	int result = 0; // 입력 확인 

	PreparedStatement ps = null;

	try{
	    Class.forName("com.mysql.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
		Statement stmt_mysql = conn_mysql.createStatement();
	

       String query = "update cartdetail set cartQuantity = ? where product_productNo = ? and cartinfo_cartNo = ?";
	
       		ps = conn_mysql.prepareStatement(query);
		ps.setString(1, cartquantity);
		ps.setString(2, productno);
		ps.setString(3, cartno);
	
		
		
		result = ps.executeUpdate();
%>
		{
			"result" : "<%=result%>"
		}

<%		
	    conn_mysql.close();
	} 
	catch (Exception e){
%>
		{
			"result" : "<%=result%>"
		}
<%		
	    e.printStackTrace();
	} 
	
%>