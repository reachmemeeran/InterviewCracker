package com.interviewcracker.dao;

import java.util.ArrayList;
import java.util.List;

import com.interviewcracker.entity.CodingQuestion;

public class CodingQuestionDAO extends JpaDAO<CodingQuestion> implements GenericDAO<CodingQuestion> {

	public CodingQuestionDAO() {
	}

	@Override
	public CodingQuestion create(CodingQuestion codingQuestion) {
		return super.create(codingQuestion);
	}

	@Override
	public CodingQuestion update(CodingQuestion codingQuestion) {
		return super.update(codingQuestion);
	}

	@Override
	public CodingQuestion get(Object codingQuestionId) {
		return super.find(CodingQuestion.class, codingQuestionId);
	}

	@Override
	public void delete(Object codingQuestionId) {
		super.delete(CodingQuestion.class, codingQuestionId);
	}

	@Override
	public List<CodingQuestion> listAll() {
		return super.findWithNamedQuery("CodingQuestion.findAll");
	}
	
	public List<CodingQuestion> listEasy() {
		return super.findWithNamedQuery("CodingQuestion.listEasy");
	}
	
	public List<CodingQuestion> listMedium() {
		return super.findWithNamedQuery("CodingQuestion.listMedium");
	}
	
	public List<CodingQuestion> listAdvanced() {
		return super.findWithNamedQuery("CodingQuestion.listAdvanced");
	}

	public CodingQuestion findBySummary(String summary) {
		List<CodingQuestion> result = super.findWithNamedQuery("CodingQuestion.findBySummary","summary",summary);
		
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public CodingQuestion findByExerciseId(Integer exerciseId) {
		List<CodingQuestion> result = super.findWithNamedQuery("CodingQuestion.findByExerciseId","exerciseId",exerciseId);
		
		if(!result.isEmpty()) {
			return result.get(0);
		}
		return null;
	}
	
	public List<CodingQuestion> listByCodeComplexity(int codeComplexityId){
		return super.findWithNamedQuery("CodingQuestion.findByCodeComplexity","catId",codeComplexityId);
	}
	
	public List<CodingQuestion> listFirstCodeComplexity(){
		return super.findWithNamedQuery("CodingQuestion.listFirstCodeComplexity",0,4);
	}
	
	public List<CodingQuestion> listNewCodingQuestions(){
		return super.findWithNamedQuery("CodingQuestion.listNew",0,4);
	}
	
	public List<CodingQuestion> search(String keyword){
		return super.findWithNamedQuery("CodingQuestion.search","keyword",keyword);
	}
	
	@Override
	public long count() {
		return super.countWithNamedQuery("CodingQuestion.countAll");
	}

	public long countByCodeComplexity(int codeComplexityId) {
		return super.countWithNamedQuery("CodingQuestion.countByCodeComplexity","codeComplexId",codeComplexityId);
	}
	
}
