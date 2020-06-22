<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update problem</title>
</head>
<body>
  <p>Please update problem fields and press
    Update problem button or press Cancel button.</p>
  <c:url var="productUrl" value="/product.jsp"/>
  <form method="post" action="product">
    <input type="hidden" name="actiontype" value="updateproduct"/>
    <input type="hidden" name="problem_id" value="${param.problem_id}"/>
    <p>Problem id: <c:out value="${param.problem_id}"/></p>
    <p>Name:
    <input type="text" name="problem_name" value="${param.problem_name}"/></p>
    <p>Problem description:
    <input type="text" name="problem_description" 
      value="${param.problem_description}"/></p>
    <input type="submit" name="deleteproduct" value="Update problem"/>
    <input type= "button" onclick="window.location.href='${productUrl}'" 
      value="Cancel">
  </form>
</body>
</html>
