<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Problem list</title>
</head>
<body bgcolor="#FA8072">
  <jsp:useBean id="productListBean" 
    class="ua.cn.stu.databean.ProductListDatabean"/>
  <h1 align="center">Problem page</h1>
  <form method="post" action="product">
    <table bordercolor="black" style="width:100%" border="4" bgcolor="#90EE90" rules="all">
      <tr height="50px" align="center">
        <td>Id</td>
        <td>Name</td>
        <td>Description problem</td>
        <td>Action</td>
      </tr>
      <tr align="center">
        <td>
        </td>
        <td>
          <input type="text" name="problem_name" required autofocus size="15" maxlength="200"/>
        </td>
        <td>
          <textarea name="problem_description" maxlength="200" required cols="50" rows="4"></textarea>
        </td>
        <td>
          <input type="hidden" name="actiontype" value="addproduct"/>
          <input type="submit" name="addproduct" value="Add problem">
        </td>
      </tr>
    </table>
  </form>
</body>
</html>

   