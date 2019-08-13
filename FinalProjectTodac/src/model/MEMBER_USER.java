package model;

public class MEMBER_USER {

		String	muid;	
		String 	pw;	
		String	name;	
		String	birth;	
		int 	age;	
		String	email;	
		String	phone;	
		double	latitude;	
		double longitude;	
		String post_num;	
		String address_detail;	
		String address_base;	
		String address_road;	
		int  status;	
		int chk_num;	
		int	report_count;
		
		
		
		
		@Override
		public String toString() {
			return "MEMBER_USER [muid=" + muid + ", pw=" + pw + ", name=" + name + ", birth=" + birth + ", age=" + age
					+ ", email=" + email + ", phone=" + phone + ", latitude=" + latitude + ", longitude=" + longitude
					+ ", post_num=" + post_num + ", address_detail=" + address_detail + ", address_base=" + address_base
					+ ", address_road=" + address_road + ", status=" + status + ", chk_num=" + chk_num
					+ ", report_count=" + report_count + "]";
		}




		public MEMBER_USER() {
		}




		public String getMuid() {
			return muid;
		}




		public void setMuid(String muid) {
			this.muid = muid;
		}




		public String getPw() {
			return pw;
		}




		public void setPw(String pw) {
			this.pw = pw;
		}




		public String getName() {
			return name;
		}




		public void setName(String name) {
			this.name = name;
		}




		public String getBirth() {
			return birth;
		}




		public void setBirth(String birth) {
			this.birth = birth;
		}




		public int getAge() {
			return age;
		}




		public void setAge(int age) {
			this.age = age;
		}




		public String getEmail() {
			return email;
		}




		public void setEmail(String email) {
			this.email = email;
		}




		public String getPhone() {
			return phone;
		}




		public void setPhone(String phone) {
			this.phone = phone;
		}




		public double getLatitude() {
			return latitude;
		}




		public void setLatitude(double latitude) {
			this.latitude = latitude;
		}




		public double getLongitude() {
			return longitude;
		}




		public void setLongitude(double longitude) {
			this.longitude = longitude;
		}




		public String getPost_num() {
			return post_num;
		}




		public void setPost_num(String post_num) {
			this.post_num = post_num;
		}




		public String getAddress_detail() {
			return address_detail;
		}




		public void setAddress_detail(String address_detail) {
			this.address_detail = address_detail;
		}




		public String getAddress_base() {
			return address_base;
		}




		public void setAddress_base(String address_base) {
			this.address_base = address_base;
		}




		public String getAddress_road() {
			return address_road;
		}




		public void setAddress_road(String address_road) {
			this.address_road = address_road;
		}




		public int getStatus() {
			return status;
		}




		public void setStatus(int status) {
			this.status = status;
		}




		public int getChk_num() {
			return chk_num;
		}




		public void setChk_num(int chk_num) {
			this.chk_num = chk_num;
		}




		public int getReport_count() {
			return report_count;
		}




		public void setReport_count(int report_count) {
			this.report_count = report_count;
		}




		public MEMBER_USER(String muid, String pw, String name, String birth, int age, String email, String phone,
				double latitude, double longitude, String sample4_postcode, String address_detail, String address_base,
				String address_road) {
			super();
			this.muid = muid;
			this.pw = pw;
			this.name = name;
			this.birth = birth;
			this.age = age;
			this.email = email;
			this.phone = phone;
			this.latitude = latitude;
			this.longitude = longitude;
			this.post_num = sample4_postcode;
			this.address_detail = address_detail;
			this.address_base = address_base;
			this.address_road = address_road;
		}
		
		
}
		
		