package ua.cn.stu.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import ua.cn.stu.domain.Product;


public class HibernateDAOFactory {
	private static HibernateDAOFactory instance;

	private ProductDAO productDAO;

	private Session session;

	//Ініціалізація синглетону
	public static HibernateDAOFactory getInstance() {
		if (null == instance) {
			instance = new HibernateDAOFactory();
		}
		return instance;
	}

	//Створення обєкта Session для взаємодії з Hibernate
	public Session getSession() {
		if (null == session) {
			Configuration configuration = new Configuration();
			configuration.setProperty(Environment.DRIVER, "org.postgresql.Driver");
			configuration.setProperty(Environment.URL,
					"jdbc:postgresql://localhost:5432/shop");
			configuration.setProperty(Environment.USER, "postgres");
			configuration.setProperty(Environment.PASS, "1");
			configuration.setProperty(Environment.DIALECT, 
					"org.hibernate.dialect.PostgreSQLDialect");
			configuration.setProperty(Environment.HBM2DDL_AUTO, "create");
			configuration.setProperty(Environment.SHOW_SQL, "true");
			configuration.addAnnotatedClass(Product.class);
			StandardServiceRegistryBuilder serviceRegistryBuilder = 
					new StandardServiceRegistryBuilder();
			serviceRegistryBuilder.applySettings(configuration.getProperties());
			ServiceRegistry serviceRegistry = serviceRegistryBuilder.build();
			SessionFactory sessionFactory =
					configuration.buildSessionFactory(serviceRegistry);
			session = sessionFactory.openSession();
		}
		return session;
	}

	public ProductDAO getProductDAO() {
		if (null == productDAO) {
			productDAO = new ProductDAO(getSession());
		}
		return productDAO;
	}

	public void closeSession() {
		getSession().close();
	}

}
