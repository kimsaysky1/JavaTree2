package org.javatree.www.DAO;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.javatree.www.VO.Coding;
import org.javatree.www.VO.Course;
import org.javatree.www.VO.Lecture;
import org.javatree.www.VO.Member_jt;
import org.javatree.www.VO.Subnote;

public interface courseDAO {

	public ArrayList<Lecture> getAllLectureListForTeach(String id);
	public ArrayList<Course> getAllCourseListForCodingBox(String id);
	public ArrayList<Lecture> getAllLectureListForCodingBox(int courseno);
	public ArrayList<Course> getAllCourseList();
	public ArrayList<Course> selectListbyField(Map<String, Object> kong);
	public ArrayList<Course> selectAllCourseList(Map<String, Object> kong);
	public ArrayList<Course> selectRecentRank();
	public ArrayList<Course> selectAllRank();
	
	public ArrayList<Course> selectAllCourseListForTeach(String id, RowBounds rowbounds);
	public int getTotal(String id);
	public void insertCourse(Course course);
	public void insertCourseType(Map<String, Object> map);
	public void insertTeachCourse(Map<String, Object> map);
	public void insertLecture(Lecture lecture);
	public void insertLectureCoding();
	public void insertCoding(Coding coding);
	public void insertSubnote(Subnote subnote);
	
	public ArrayList<Course> studyMainView(Map<String, Object> kong);
	public ArrayList<String> selectLatelyPurchasedLectureList1(Map<String, Object> kong);
	public ArrayList<String> selectLatelyPurchasedLectureList2(Map<String, Object> kong);
	public ArrayList<String> recentlyCompletedLectureList1(Map<String, Object> kong);
	public ArrayList<String> recentlyCompletedLectureList2(Map<String, Object> kong);
	public ArrayList<Course> pagingCourse(Map<String, Object> kong);
	public ArrayList<Course> pagingStudyCourse(Map<String, Object> kong);
	public int selectTotal(Map<String, Object> kong);

	public void deleteLecture(int lectureno);
	public void deleteLectureCoding(int lectureno);
	public void selectdelete();
	public void deleteCheckLecture(int lectureno);
	public void deleteStudyLecture(int lectureno);
	public void deleteSubnote(int lectureno);
	public void updateLecture(Map<String, Object> map);
	public void updateSubnote(Subnote subnote);
	public ArrayList<Course> selectAllCourseListForTeach(String id);
	public void insertTeachLecture(Map<String, Object> map);
	public Lecture selectLecture(int lectureno);
	public ArrayList<Lecture> selectAllLectureListForTeach(int courseno);
	
	public ArrayList<Course> selectAllCourseListForTeachforDetail(String id);
	public ArrayList<Lecture> selectAllLectureListForTeach(String id);
	public Course selectCourse(int courseno);
	public int selectDefaultTotal(Map<String, Object> kong);
	public int selectFieldTotal(Map<String, Object> kong);
	public void insertLectureForStudy(Map<String, Object> kong);
	public void insertLectureForStudy1(Map<String, Object> kong);
	public int updateMemberPoint(Map<String, Object> kong);
	public ArrayList<Lecture> selectCourseDefaultDetail(Map<String, Object> kong);
	public void updateStudentCount(int lectureno);
	public ArrayList<Course> searchCourse(Map<String, Object> kong);
	public ArrayList<Lecture> selectCourseDefaultDetail(int courseno);
	public int checkStudyCourse(Map<String, Object> kong);
	public int selectCourseDefaultDetailTotal(Map<String, Object> kong);
	public void updateCourse(Map<String, Object> map);
	public void updateCourseName(Map<String, Object> map);
	public void updateCourseIntrodution(Map<String, Object> map);
	public void deleteTeachLecture(int lectureno);
	public ArrayList<Coding> getAllCodingList(String id);
	public void updateCodingfromMain(Coding coding);
	public void insertCodingfromMain(Coding coding);
	public Coding getCodingContent(int codingno);
	public void deleteCodingfromMain(int codingno);
	public ArrayList<Integer> getCodingno(int lectureno);
	public ArrayList<Coding> getCodinginlecture(ArrayList<Integer> codingnoList);
	public int selectMaxLectureno();
	public void insertcodinginbox(Map<String, Object> studycoding);
	public void insertlecturecodingInInsertLecture(Map<String, Object> map);
	public void deleteCodingTemp(String id);
	public ArrayList<Coding> selectForCodingTemp(String id);
	public String getCodefromStudy(int codingno);
	public ArrayList<Coding> getSelectedCoding(String id);
	public void insertCodingTemp(Map<String, Object> map);
	public void insertLectureCoding(Map<String, Object> map);
	public Lecture selectCourseForDetail(int courseno);
	public String selectUploadedFileName(int lectureno);
	public ArrayList<Lecture> selectCourseDetailForStudy(Map<String, Object> kong);
	public ArrayList<Course> pagingTeachCourse(Map<String, Object> kong);
	public int selectTeachTotal(Map<String, Object> kong);
	public Coding selectedCheck(int codingno);
	public ArrayList<Lecture> selectWatchingLecture(Map<String, Object> kong);
	public ArrayList<Lecture> selectWatchingLecture1(Map<String, Object> kong);
	public int selectLectureCoding(Map<String, Object> map);
	public ArrayList<Integer> selectedAllLectureCoding(int lectureno);
	public int selectedAllLectureCodingCount(int lectureno);
	public void deleteLectureCodingForQuestionBox(Map<String, Object> mapfordele);
	public String selectFileName(int lectureno);
	public String selectSubNoteName(int lectureno);
	
	// 영호 추가
	public ArrayList<Coding> selectedAllCoding(int lectureno);
	
	
}
