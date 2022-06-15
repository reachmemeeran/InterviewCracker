package com.interviewcracker.dao;

import java.util.List;

import com.interviewcracker.entity.CodeComplexity;

public class CodeComplexityDAO extends JpaDAO<CodeComplexity> implements GenericDAO<CodeComplexity> {

	public CodeComplexityDAO() {
	}

	@Override
	public CodeComplexity create(CodeComplexity codeComplexity) {
		return super.create(codeComplexity);
	}

	@Override
	public CodeComplexity update(CodeComplexity codeComplexity) {
		return super.update(codeComplexity);
	}

	@Override
	public CodeComplexity get(Object codeComplexityId) {
		return super.find(CodeComplexity.class, codeComplexityId);
	}

	@Override
	public void delete(Object codeComplexityId) {
		super.delete(CodeComplexity.class, codeComplexityId);
	}

	@Override
	public List<CodeComplexity> listAll() {
		return super.findWithNamedQuery("CodeComplexity.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("CodeComplexity.countAll");
	}
	
	public CodeComplexity findByName(String CodeComplexityName) {
		List<CodeComplexity> listCodeComplexity = super.findWithNamedQuery("CodeComplexity.findByName","name",CodeComplexityName);
		if(listCodeComplexity !=null && listCodeComplexity.size()>0) {
			return listCodeComplexity.get(0);
		}
		return null;
	}
}
