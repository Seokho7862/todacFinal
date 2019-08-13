package dao;

import java.util.ArrayList;
import java.util.HashMap;

import model.disease_db;

public interface IDisease_dbDao {

	public ArrayList<disease_db> getSubjectList(HashMap<String, String> dis);
	
}
