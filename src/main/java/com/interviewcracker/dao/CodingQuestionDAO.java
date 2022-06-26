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

	public CodingQuestion findByTitle(String title) {
		List<CodingQuestion> result = super.findWithNamedQuery("CodingQuestion.findByTitle","title",title);
		
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
	
	public List<CodingQuestion> listBestSellingCodingQuestions() {
		return super.findWithNamedQuery("OrderDetail.bestSelling", 0, 4);
	}
	
	public List<CodingQuestion> listMostFavoredCodingQuestions() {
		List<CodingQuestion> mostFavoredCodingQuestions = new ArrayList<>();
		
		List<Object[]> result = super.findWithNamedQueryObjects("Review.mostFavoredCodingQuestions", 0, 4);
		
		if (!result.isEmpty()) {
			for (Object[] elements : result) {
				CodingQuestion codingQuestion = (CodingQuestion) elements[0];
				mostFavoredCodingQuestions.add(codingQuestion);
			}
		} 
		
		return mostFavoredCodingQuestions;
	}
}
