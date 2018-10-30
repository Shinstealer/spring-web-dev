package parser;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MysqlDAO {
	@Inject
	private SqlSession session;
	private static String namespace="org.zerock.mapper.BookingMapper";
	
	public void input_reviews(BookingMysqlDTO BDto) throws Exception {
		session.insert(namespace + ".input_reviews" ,BDto);
	}
}
