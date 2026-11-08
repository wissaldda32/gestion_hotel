<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    session.invalidate();  // Supprime la session de l'admin
    response.sendRedirect("index.jsp");  // Redirige vers la page de connexion
%>
