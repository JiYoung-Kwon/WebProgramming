package kpu.web.club.persistence;

import java.util.HashMap;
import java.util.Map;

import kpu.web.club.domain.StudentVO;

public class StudentDAO {

	private static Map<String, StudentVO> storage = new HashMap<String, StudentVO>();
	
	public boolean join (StudentVO student) {
		try {
			storage.put(student.getId(),student);
		}
		catch(Exception e) {
			return false;
		}
		return true;
	}
}