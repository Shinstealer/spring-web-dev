package parser;

public class BookingMysqlDTO {
	private int review_seq;
	private String htl_name;
	private String htl_addr;
	private String writer;
	private String score;
	private String title;
	private String review_neg;
	private String review_pos;
	private String write_date;
	
	public BookingMysqlDTO() {
		super();
	}


	public BookingMysqlDTO(int review_seq, String htl_name, String htl_addr, String writer, String score, String title,
			String review_neg, String review_pos, String write_date) {
		super();
		this.review_seq = review_seq;
		this.htl_name = htl_name;
		this.htl_addr = htl_addr;
		this.writer = writer;
		this.score = score;
		this.title = title;
		this.review_neg = review_neg;
		this.review_pos = review_pos;
		this.write_date = write_date;
	}
	
	
	public BookingMysqlDTO(String htl_name, String htl_addr, String writer, String score, String title,
			String review_neg, String review_pos, String write_date) {
		super();
		this.htl_name = htl_name;
		this.htl_addr = htl_addr;
		this.writer = writer;
		this.score = score;
		this.title = title;
		this.review_neg = review_neg;
		this.review_pos = review_pos;
		this.write_date = write_date;
	}

	
	
	public BookingMysqlDTO(String writer, String score, String title, String review_neg, String review_pos,
			String write_date) {
		super();
		this.writer = writer;
		this.score = score;
		this.title = title;
		this.review_neg = review_neg;
		this.review_pos = review_pos;
		this.write_date = write_date;
	}


	public int getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(int review_seq) {
		this.review_seq = review_seq;
	}
	public String getHtl_name() {
		return htl_name;
	}
	public void setHtl_name(String htl_name) {
		this.htl_name = htl_name;
	}
	public String getHtl_addr() {
		return htl_addr;
	}
	public void setHtl_addr(String htl_addr) {
		this.htl_addr = htl_addr;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReview_neg() {
		return review_neg;
	}
	public void setReview_neg(String review_neg) {
		this.review_neg = review_neg;
	}
	public String getReview_pos() {
		return review_pos;
	}
	public void setReview_pos(String review_pos) {
		this.review_pos = review_pos;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	@Override
	public String toString() {
		return "BookingMysqlDTO [review_seq=" + review_seq + ", htl_name=" + htl_name + ", htl_addr=" + htl_addr
				+ ", writer=" + writer + ", score=" + score + ", title=" + title + ", review_neg=" + review_neg
				+ ", review_pos=" + review_pos + ", write_date=" + write_date + "]";
	}
	
	
}
