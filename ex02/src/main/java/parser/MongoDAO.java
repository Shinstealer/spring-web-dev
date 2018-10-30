package parser;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class MongoDAO {
		//connection
		MongoClient mclient = new MongoClient("localhost" , 27017);
		//DB select
		MongoDatabase review_collector = mclient.getDatabase("test");
		//collection(Table)select
		MongoCollection<Document> collection = review_collector.getCollection("booking_reviews");
		
		
		
		//리뷰 저장
		
		public void insertReviews(BookingMongoDTO BDto) {
			try {
				Document doc = new Document("htl_name" , BDto.getHtl_name())
						.append("img_url", BDto.getImg_url())
						.append("htl_review", BDto.getImg_url());
				
				collection.insertOne(doc);
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
			}
		}
}
