package kpu.web.club.domain;

public class SchedulesVO {

	private int uid;
	private String id;
	private String title;
	private String sc_year;
	private String sc_month;
	private String sc_day;
	private String start_time;
	private String end_time;
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSc_year() {
		return sc_year;
	}
	public void setSc_year(String sc_year) {
		this.sc_year = sc_year;
	}
	public String getSc_month() {
		return sc_month;
	}
	public void setSc_month(String sc_month) {
		this.sc_month = sc_month;
	}
	public String getSc_day() {
		return sc_day;
	}
	public void setSc_day(String sc_day) {
		this.sc_day = sc_day;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
}
