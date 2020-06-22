<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>My Problem</title>
</head>
<body>
  <jsp:useBean id="productListBean" 
    class="ua.cn.stu.databean.ProductListDatabean"/>
  <h1>My Problem</h1>
  <form method="post" action="product">
    <table bordercolor="black" style="width:100%" border="4" bgcolor="#90EE90" rules="all">
      <tr>
        <td>Id</td>
        <td>Name</td>
        <td>Description problem</td>
        <td>Action</td>
      </tr>
      <c:forEach var="product" items="${productListBean.productList}">
        <tr>
          <td>
            <c:out value="${product.id}"/>	
          </td>
          <td>
            <c:out value="${product.name}"/>
          </td>
          <td>
            <c:out value="${product.description}"/>
          </td>
          <td>
            <c:url var="deleteUrl" value="/deleteproduct.jsp">
              <c:param name="problem_id" value="${product.id}"/>
              <c:param name="problem_name" value="${product.name}"/>
              <c:param name="problem_description" 
                value="${product.description}"/>
            </c:url>
            <c:url var="updateUrl" value="/updateproduct.jsp">
              <c:param name="problem_id" value="${product.id}"/>
              <c:param name="problem_name" value="${product.name}"/>
              <c:param name="problem_description" 
                value="${product.description}"/>
            </c:url>
            <p><a href="${deleteUrl}">Delete problem</a></p>
            <p><a href="${updateUrl}">Update problem</a></p>
          </td>
        </tr>
      </c:forEach>

    </table>
  </form>
</body>
</html>

   