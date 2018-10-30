package parser;

import java.util.Collections;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;

public class mongoMain {
public static void main(String[] args) {
	
	MongoClient mongoClient = new MongoClient("localhost" , 27017);
	System.out.println("MongoClient Connected");
	
	MongoDatabase db = mongoClient.getDatabase("test");
	System.out.println("get 'test' MongoDataBase");
	
	MongoCollection<Document> collections = db.getCollection("booking_reviews");
	System.out.println("DB명:" + db.getName());
	
	FindIterable<Document> iterate = collections.find();
	
	MongoCursor<Document> cursor = iterate.iterator();
	
	while(cursor.hasNext()) {
		Document document = cursor.next();
		String JsonResult = document.toJson();
		System.out.println(JsonResult);
	}
}
}
