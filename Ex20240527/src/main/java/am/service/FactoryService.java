package am.service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FactoryService {

	private static SqlSessionFactory factory;
	
	static {
		Reader r = null;
		try {
			r = Resources.getResourceAsReader("am/config/config.xml");
			factory = new SqlSessionFactoryBuilder().build(r);
			r.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
	
	
}
