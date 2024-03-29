package com.interviewcracker.entity;
// Generated 14 Jun 2022, 09:42:01 by Hibernate Tools 4.3.6.Final

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

/**
 * CodingQuestion generated by hbm2java
 */
@Entity
@Table(name = "coding_question", catalog = "interviewcrackerdb")
@NamedQueries({
	@NamedQuery(name="CodingQuestion.findAll", query= "SELECT b FROM CodingQuestion b ORDER BY b.codeComplexityId, b.codingQuestionId"),
	@NamedQuery(name="CodingQuestion.countAll", query= "SELECT count(b) FROM CodingQuestion b "),
	@NamedQuery(name="CodingQuestion.findBySummary",query="SELECT b FROM CodingQuestion b WHERE b.summary=:summary"),
	@NamedQuery(name="CodingQuestion.findByExerciseId",query="SELECT b FROM CodingQuestion b WHERE b.codingQuestionId=:exerciseId"),
	@NamedQuery(name="CodingQuestion.listNew",query="SELECT b FROM CodingQuestion b ORDER BY b.codingQuestionId DESC"),
	@NamedQuery(name="CodingQuestion.listEasy",query="SELECT b FROM CodingQuestion b WHERE b.codeComplexityId=1"
			+ " ORDER BY b.codingQuestionId"),
	@NamedQuery(name="CodingQuestion.listMedium",query="SELECT b FROM CodingQuestion b WHERE b.codeComplexityId=2 "
			+ " ORDER BY b.codingQuestionId"),
	@NamedQuery(name="CodingQuestion.listAdvanced",query="SELECT b FROM CodingQuestion b WHERE b.codeComplexityId=3 "
			+ " ORDER BY b.codingQuestionId"),
	@NamedQuery(name="CodingQuestion.search",query="SELECT b FROM CodingQuestion b WHERE b.summary LIKE '%'|| :keyword || '%'"),
	@NamedQuery(name="CodingQuestion.countByCodeComplexity",query="SELECT count(b) FROM CodingQuestion b WHERE"
			+ " b.codeComplexityId=:codeComplexId")
})
public class CodingQuestion implements java.io.Serializable {

	private Integer codingQuestionId;
	private Integer codeComplexityId;
	private String summary;
	private String question;
	private String output;
	private String lesson;
	private String code;
	private String anscode;
	private Character status;

	public CodingQuestion() {
	}

	public CodingQuestion(Integer codeComplexityId, String summary, String question, String output, 
			String lesson, String code, String anscode, Character status) {
		this.codeComplexityId = codeComplexityId;
		this.summary = summary;
		this.question = question;
		this.output = output;
		this.lesson = lesson;
		this.code = code;
		this.anscode = anscode;
		this.status = status;
	}


	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "coding_question_id", unique = true, nullable = false)
	public Integer getCodingQuestionId() {
		return this.codingQuestionId;
	}

	public void setCodingQuestionId(Integer codingQuestionId) {
		this.codingQuestionId = codingQuestionId;
	}

	@Column(name = "code_complexity_id")
	public Integer getCodeComplexityId() {
		return this.codeComplexityId;
	}

	public void setCodeComplexityId(Integer codeComplexityId) {
		this.codeComplexityId = codeComplexityId;
	}

	@Column(name = "summary", nullable = false, length = 100)
	public String getSummary() {
		return this.summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	@Column(name = "question")
	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Column(name = "output")
	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	@Column(name = "lesson")
	public String getLesson() {
		return lesson;
	}

	public void setLesson(String lesson) {
		this.lesson = lesson;
	}
	
	@Column(name = "code")
	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Column(name = "anscode")
	public String getAnscode() {
		return anscode;
	}

	public void setAnscode(String anscode) {
		this.anscode = anscode;
	}

	@Column(name = "status")
	public Character getStatus() {
		return status;
	}

	public void setStatus(Character status) {
		this.status = status;
	}

}
