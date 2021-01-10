<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String useremail = request.getParameter("useremail");
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

       String query = "select l.userinfo_userEmail userEamil, l.userinfo_like_userEmail sellerEmail, r.product_productNo productNo from likeuser l, register r where l.userinfo_userEmail = ? and l.userinfo_like_userEmail = r.userinfo_userEmail and r.product_productNo = ?";
	
        ps = conn_mysql.prepareStatement(query); // 
        ps.setString(1, useremail);
	ps.setString(2, productno);


        rs = ps.executeQuery();
%>
		{ 
  			"selleFavorite_info"  : [ 
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
			"userEamil" : "<%=rs.getString(1) %>",
			"sellerEmail" : "<%=rs.getString(2) %>",
			"productNo" : "<%=rs.getString(3) %>"

			
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