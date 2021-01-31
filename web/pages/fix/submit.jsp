<%-- 
    Document   : submit
    Created on : Jun 14, 2020, 12:15:22 PM
    Author     : genz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submit</title>
        <link rel="icon" href="../../images/favi.ico" type="image/x-icon">
    </head>
    <body>
        <jsp:useBean id="insert" class="fix.Solved"/>
        <% 
            if (request.getParameter("komentar") != null && request.getParameter("komentar") != "") {
                    String ideror = (String) session.getAttribute("eror");
                    String idteknisi = (String) session.getAttribute("idteknisi");
                    String idmesin = (String) session.getAttribute("tipe");
                    String komentar = request.getParameter("komentar");
                    
                    insert.idEror = ideror;
                    insert.idTeknisi = idteknisi;
                    insert.idMesin = idmesin;
                    insert.komentar = komentar;
                    insert.insertError();
                    response.sendRedirect("../home.jsp");
                } else {
                response.sendRedirect("solved.jsp");
            }
            
            
            
        %>
    </body>
</html>
