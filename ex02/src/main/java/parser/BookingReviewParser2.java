package parser;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class BookingReviewParser2 {
	static String main_url = "https://www.booking.com/reviews/kr/city/seoul.ko.html?;offset=";
	static int offset = 0;
	static String perfect_url = main_url + offset;
	static int i = 0;
	static MongoDAO dao = new MongoDAO();
	
	
public static void main(String[] args) throws IOException {
	
	while(offset <= 120) {
		Document booking_htl = Jsoup.connect(perfect_url).get();
		//htl_list
		Elements htl_list = booking_htl.select("ul.rlp-main-hotels__container");
		//htl_img
		Elements htl_img = booking_htl.select("div.rlp-main-hotel__container");
		
		//htl_list
		for (Element element : htl_list) {
			String htl_name = element.select("div > a.rlp-main-hotel__hotel-name-link").text(); 
			System.out.println(htl_name + "\t");
			
			
			
			for (Element element1 : htl_img) {
				
				String img_url = element1.getElementsByTag("img").attr("src");
				
				System.out.println("썸네일 : " + img_url);
				
				
				BookingMongoDTO dto = new BookingMongoDTO(htl_name, img_url);
				dao.insertReviews(dto);
				
			}
			i += 30;
		System.out.println("--------------------------------------------------------------offset:" + i +  "-------------------------------------------------------------");
		}
		System.out.println("---------------------------------------------------------------------------------------------");
		
		//reviews
	/*	Elements review_url = booking_htl.select("ul.rlp-main-hotel-reviews > li.rlp-main-hotel-review__review_link > a");
		for (Element element : review_url) {
			String url = element.attr("abs:href");
			
			//System.out.println(url);
			
			Document reviews_page = Jsoup.connect(url).get(); 
			//String htl_score = reviews_page.select("div.review_item_review span.review-score-badge").text();
			String htl_review = reviews_page.select("div.review_item_review_header").text();
			
			
			//System.out.println(htl_score);
			System.out.println("-------------------------------------------------------------------------------------");
			System.out.println(htl_review);
			
			BookingMongoDTO dto = new BookingMongoDTO(htl_review);
			dao.insertReviews(dto);
		}*/
	}
	
	
}
}
