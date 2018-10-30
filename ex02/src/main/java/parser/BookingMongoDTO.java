package parser;

public class BookingMongoDTO {
 private String htl_name;
 private String img_url;
 private String htl_review;

 public BookingMongoDTO() {
	super();
}
 
 
public BookingMongoDTO(String htl_name, String img_url) {
	super();
	this.htl_name = htl_name;
	this.img_url = img_url;
}



public BookingMongoDTO(String htl_review) {
	super();
	this.htl_review = htl_review;
}


public BookingMongoDTO(String htl_name, String img_url, String htl_review) {
	super();
	this.htl_name = htl_name;
	this.img_url = img_url;
	this.htl_review = htl_review;
}
public String getHtl_name() {
	return htl_name;
}
public void setHtl_name(String htl_name) {
	this.htl_name = htl_name;
}
public String getImg_url() {
	return img_url;
}
public void setImg_url(String img_url) {
	this.img_url = img_url;
}
public String getHtl_review() {
	return htl_review;
}
public void setHtl_review(String htl_review) {
	this.htl_review = htl_review;
}
@Override
public String toString() {
	return "BookingDTO [htl_name=" + htl_name + ", img_url=" + img_url + ", htl_review=" + htl_review + "]";
}
 
 
}
