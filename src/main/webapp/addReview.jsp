<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String rating = request.getParameter("rating");
    String comment = request.getParameter("comment");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestionhotel", "root", "");
        PreparedStatement ps = con.prepareStatement("INSERT INTO reviews(name, rating, comment) VALUES (?, ?, ?)");
        ps.setString(1, name);
        ps.setInt(2, Integer.parseInt(rating));
        ps.setString(3, comment);
        ps.executeUpdate();
        con.close();
        response.sendRedirect("reviews.jsp");
    } catch (Exception e) {
        out.println("<p>Erreur lors de l'enregistrement.</p>");
    }
%>
