<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete problem</title>
</head>
<body>
  <p>Below problem will be deleted:</p>
  <p>Problem id ${param.problem_id}</p>
  <p>Name ${param.problem_name}</p>
  <p>Problem description ${param.problem_description}</p>
  <p>Could you please confirm?</p>
  <c:url var="productUrl" value="/product.jsp"/>
  <form method="post" action="product">
    <input type="hidden" name="actiontype" value="deleteproduct"/>
    <input type="hidden" name="problem_id" value="${param.problem_id}">
    <input type="submit" name="deleteproduct" value="Delete problem">
    <input type= "button" onclick="window.location.href='${productUrl}'" 
      value="Cancel">
  </form>
</body>
</html>
