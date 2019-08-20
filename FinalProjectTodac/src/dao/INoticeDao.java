package dao;

import java.util.ArrayList;
import java.util.HashMap;

import model.notice;

public interface INoticeDao {
	
	public void noticeWrite(notice notice);
	public ArrayList<notice> getNoticeList();
	public notice getNotice(HashMap<String, Integer> nid);
	public void modifyNotice(notice notice);
	public void deleteNotice(HashMap<String, Integer> nid);

}
