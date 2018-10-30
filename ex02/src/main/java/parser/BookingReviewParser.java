package parser;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class BookingReviewParser {
	//호텔 페이지 서울
	static String url = "https://www.booking.com/searchresults.ko.html?&ss=%EC%84%9C%EC%9A%B8&nflt=class%3D4%3Bclass%3D5%3Bclass%3D3%3B&rsf=class-3&lsf=class%7C3%7C195&offset=";
	//호텔 페이지 이동 변수
	static int offset = 0;
	static String perfect_url = url + offset;
	static int i = 0;
	
public static void main(String[] args) throws IOException {
	
	while(offset <= 120) {
		
		Document doc = Jsoup.connect(perfect_url).get();
		Document htl_detail_page = null;
		Elements htl_list = doc.select("div.sr_item_main_block > h3 > a");
		String sub_url = null;
		String review_url = null;
		String base_url ="https://booking.com";
		try {
			for (Element element : htl_list) {
				
				//호텔 페이지 URL 추출
				String title_url = element.attr("abs:href");
				sub_url = title_url.substring(0,136);
				//System.out.println(title_url);
				//System.out.println("-------------------------------------------------------------------------------------");
				//System.out.println(sub_url);
				
				htl_detail_page = Jsoup.connect(sub_url).get();
				Elements move_review = htl_detail_page.select("#bodyconstraint #hotelTmpl .recent_property_reviews_block .containh2 div a");
				
				for (Element element2 : move_review) {
					
					review_url = element2.getElementsByTag("a").attr("href");
					String review_page = base_url + review_url;
					//System.out.println(review_page);
					//System.out.println("---------------------------------------------------------------------");
					Document doc2 = Jsoup.connect(review_page).get();
					String htl_name = doc2.select("#standalone_reviews_hotel_info_wrapper h1 >a").text();
					String htl_addr = doc2.select("#standalone_reviews_hotel_info_wrapper p.hotel_address").text();
					System.out.println("호텔명:" + htl_name+"\t");
					System.out.println("호텔주소:" + htl_addr+"\t");
					
					Elements review_info = doc2.select("li.review_item");
					for (Element element3 : review_info) {
						String writer = element3.select("div.review_item_reviewer>h4>span").text();
						String score = element3.select("span.review-score-badge").text();
						String title = element3.select("div.review_item_header_content>span").text();
						String review_neg = element3.select("p.review_neg>span").text();
						String review_pos = element3.select("p.review_pos>span").text();
						String write_date = element3.select("p.review_staydate").text();
						System.out.println("작성자:" + writer + "\t");
						System.out.println("평점:" + score+ "\t");
						System.out.println("리뷰 제목:" + title+ "\t");
						System.out.println("부정 리뷰:" + review_neg+ "\t");
						System.out.println("긍정 리뷰:" + review_pos+ "\t");
						System.out.println("작성일:" + write_date+ "\t");
						
						/*BookingMysqlDTO BDto = new BookingMysqlDTO(htl_name, htl_addr, writer, score, title, review_neg, review_pos, write_date);
						MysqlDAO dao = new MysqlDAO();
						dao.input_reviews(BDto);*/
					}
					
				}
				
				i +=1;
				System.out.println("-------------------------------------------------------------------------");
				System.out.println("수집호텔 개수:" + i +"개" );
				System.out.println("-------------------------------------------------------------------------");
				
			}	
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}
	}
	
	
}
}
