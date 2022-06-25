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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * CodingQuestion generated by hbm2java
 */
@Entity
@Table(name = "coding_question", catalog = "interviewcrackerdb")
@NamedQueries({
	@NamedQuery(name="CodingQuestion.findAll", query= "SELECT b FROM CodingQuestion b ORDER BY b.codingQuestionId"),
	@NamedQuery(name="CodingQuestion.countAll", query= "SELECT count(b) FROM CodingQuestion b"),
	@NamedQuery(name="CodingQuestion.findBySummary",query="SELECT b FROM CodingQuestion b WHERE b.summary=:summary"),
	@NamedQuery(name="CodingQuestion.findByCodeComplexity",query="SELECT b FROM CodingQuestion b JOIN "
			+ "CodeComplexity c ON b.codeComplexity.codeComplexityId=c.codeComplexityId AND c.codeComplexityId=:codeComplexId"),
	@NamedQuery(name="CodingQuestion.listFirstCodeComplexity",query="SELECT b FROM CodingQuestion b JOIN "
			+ "CodeComplexity c ON b.codeComplexity.codeComplexityId=1"),
	@NamedQuery(name="CodingQuestion.listNew",query="SELECT b FROM CodingQuestion b ORDER BY b.codingQuestionId DESC"),
	@NamedQuery(name="CodingQuestion.search",query="SELECT b FROM CodingQuestion b WHERE b.summary LIKE '%'|| :keyword || '%'"
			+ " OR b.question LIKE '%'|| :keyword || '%'"),
	@NamedQuery(name="CodingQuestion.countByCodeComplexity",query="SELECT count(b) FROM CodingQuestion b JOIN "
			+ "CodeComplexity c ON b.codeComplexity.codeComplexityId=c.codeComplexityId AND c.codeComplexityId=:codeComplexId")
})
public class CodingQuestion implements java.io.Serializable {

	private Integer codingQuestionId;
	private CodeComplexity codeComplexity;
	private String summary;
	private String question;
	private Set<CodingTestCase> codingTestCases = new HashSet<CodingTestCase>(0);
	private Set<StudentCoding> studentCodings = new HashSet<StudentCoding>(0);

	public CodingQuestion() {
	}

	public CodingQuestion(CodeComplexity codeComplexity, String summary, String question) {
		this.codeComplexity = codeComplexity;
		this.summary = summary;
		this.question = question;
	}

	public CodingQuestion(CodeComplexity codeComplexity, String summary, String question, Set<CodingTestCase> codingTestCases,
			Set<StudentCoding> studentCodings) {
		this.codeComplexity = codeComplexity;
		this.summary = summary;
		this.question = question;
		this.codingTestCases = codingTestCases;
		this.studentCodings = studentCodings;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "code_complexity_id", nullable = false)
	public CodeComplexity getCodeComplexity() {
		return this.codeComplexity;
	}

	public void setCodeComplexity(CodeComplexity codeComplexity) {
		this.codeComplexity = codeComplexity;
	}

	@Column(name = "summary", nullable = false, length = 100)
	public String getSummary() {
		return this.summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	@Column(name = "question", nullable = false, length = 1000)
	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	
	  @OneToMany(fetch = FetchType.LAZY, mappedBy = "codingQuestion") 
	  public Set<CodingTestCase> getCodingTestCases() { 
		  return this.codingTestCases; 
	  }
	  
	  public void setCodingTestCases(Set<CodingTestCase> codingTestCases) { 
		  this.codingTestCases = codingTestCases; 
	  }
	  
	  @OneToMany(fetch = FetchType.LAZY, mappedBy = "codingQuestion") 
	  public Set<StudentCoding> getStudentCodings() { 
		  return this.studentCodings; 
	  }
	  
	  public void setStudentCodings(Set<StudentCoding> studentCodings) { 
		  this.studentCodings = studentCodings; 
	  }
	  
}
