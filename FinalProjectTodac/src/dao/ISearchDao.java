package dao;

import java.util.ArrayList;
import java.util.HashMap;

import model.search;

public interface ISearchDao {

	public void Search(search s);
	public ArrayList<search> getListOfSearch(HashMap<String, Object> param);

}
