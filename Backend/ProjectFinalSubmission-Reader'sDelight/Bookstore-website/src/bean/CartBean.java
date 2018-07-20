package bean;

public class CartBean {
	
		public String bookid;
		public String title;
		public String uname;
		public int price;
		public String bought;
		public int quantity;
		public String date;
		public String review;
		public String cid;

		public String getCid() {
			return cid;
		}
		public void setCid(String cid) {
			this.cid = cid;
		}
		public String getReview() {
			return review;
		}
		public void setReview(String review) {
			this.review = review;
		}
		public String getUname() {
			return uname;
		}
		public void setUname(String uname) {
			this.uname = uname;
		}
		public String getBookid() {
			return bookid;
		}
		public void setBookid(String bookid) {
			this.bookid = bookid;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getPrice() {
			return price;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public String getBought() {
			return bought;
		}
		public void setBought(String bought) {
			this.bought ="NO";
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		
}
