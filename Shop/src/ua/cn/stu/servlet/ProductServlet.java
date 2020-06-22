package ua.cn.stu.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ua.cn.stu.dao.HibernateDAOFactory;
import ua.cn.stu.domain.Product;

public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		String actionType = req.getParameter("actiontype");
		//Обробка запиту на додання продукту
		if ("addproduct".equalsIgnoreCase(actionType)) {
			String productname = req.getParameter("problem_name");
			String productdescription = req.getParameter("problem_description");
			Product product = new Product();
			product.setName(productname);
			product.setDescription(productdescription);

			HibernateDAOFactory.getInstance().getProductDAO().createProduct(product);
			//Обробка запиту на видалення продукту
		} else if ("deleteproduct".equalsIgnoreCase(actionType)) {
			String productIdString = req.getParameter("problem_id");
			Long productId = Long.parseLong(productIdString);
			HibernateDAOFactory.getInstance().getProductDAO()
			.deleteProductById(productId);
			//Обробка запиту на оновлення продукту
		} else if ("updateproduct".equalsIgnoreCase(actionType)) {
			String productIdString = req.getParameter("problem_id");
			Long productId = Long.parseLong(productIdString);
			String productname = req.getParameter("problem_name");
			String productdescription = req.getParameter("problem_description");

			Product product = HibernateDAOFactory.getInstance().getProductDAO()
					.getProductById(productId);
			product.setName(productname);
			product.setDescription(productdescription);
			HibernateDAOFactory.getInstance().getProductDAO()
			.updateProduct(product);
		}
		//Після обробки запиту перейти на сторінку продукту
		resp.sendRedirect("mylist.jsp");
	}
}
