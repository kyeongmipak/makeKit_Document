<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");
    String search = request.getParameter("search");
    String number = request.getParameter("number");

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

        String WhereDefault = "select * from product where productName like '%"+search+"%' and mod(productNo,2)=?";

        ps = conn_mysql.prepareStatement(WhereDefault);
		ps.setString(1, number);
        rs = ps.executeQuery();
%>
		{ 
  			"makekit_info"  : [ 
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
                "productType" : "<%=rs.getString(3) %>",  
                "productPrice" : "<%=rs.getString(4) %>",
                "productStock" : "<%=rs.getString(5) %>",
                "productContent" : "<%=rs.getString(6) %>",
                "productFilename" : "<%=rs.getString(7) %>",
                "productDFilename" : "<%=rs.getString(8) %>",
                "productAFilename" : "<%=rs.getString(9) %>",
                "productInsertDate" : "<%=rs.getString(10) %>",
                "productDeleteDate" : "<%= rs.getString(11) %>"
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
