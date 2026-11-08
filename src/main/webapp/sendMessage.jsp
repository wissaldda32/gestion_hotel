<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String message = request.getParameter("message");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionhotel", "root", "");
        PreparedStatement ps = con.prepareStatement("INSERT INTO messages(name, email, message) VALUES (?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, message);
        ps.executeUpdate();
        con.close();
        response.sendRedirect("contact.jsp");
    } catch (Exception e) {
        out.println("<p>Erreur lors de l'enregistrement.</p>");
    }
%>
