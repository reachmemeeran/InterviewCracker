package com.interviewcracker.entity;
// Generated 14 Jun 2022, 09:42:01 by Hibernate Tools 4.3.6.Final

import static javax.persistence.GenerationType.IDENTITY;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Courses generated by hbm2java
 */
@Entity
@Table(name = "courses", catalog = "interviewcrackerdb")
public class Courses implements java.io.Serializable {

	private Integer coursesId;
	private String courseName;
	private int studentEnrollCount;
	private Set<StudentCourse> studentCourses = new HashSet<StudentCourse>(0);

	public Courses() {
	}

	public Courses(String courseName, int studentEnrollCount) {
		this.courseName = courseName;
		this.studentEnrollCount = studentEnrollCount;
	}

	public Courses(String courseName, int studentEnrollCount, Set<StudentCourse> studentCourses) {
		this.courseName = courseName;
		this.studentEnrollCount = studentEnrollCount;
		this.studentCourses = studentCourses;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "courses_id", unique = true, nullable = false)
	public Integer getCoursesId() {
		return this.coursesId;
	}

	public void setCoursesId(Integer coursesId) {
		this.coursesId = coursesId;
	}

	@Column(name = "course_name", nullable = false, length = 64)
	public String getCourseName() {
		return this.courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	@Column(name = "student_enroll_count", nullable = false)
	public int getStudentEnrollCount() {
		return this.studentEnrollCount;
	}

	public void setStudentEnrollCount(int studentEnrollCount) {
		this.studentEnrollCount = studentEnrollCount;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "courses")
	public Set<StudentCourse> getStudentCourses() {
		return this.studentCourses;
	}

	public void setStudentCourses(Set<StudentCourse> studentCourses) {
		this.studentCourses = studentCourses;
	}

}
