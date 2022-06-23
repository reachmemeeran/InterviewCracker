package com.interviewcracker.entity;

import java.util.Date;

public class OkHttpResponse {

	private Boolean success;
	private Date timestamp;
	private String output;
	private String error;
	private String language;

	public OkHttpResponse() {
	}

	public OkHttpResponse(Boolean success,Date timestamp,String output,String error,String language) {
		this.success = success;
		this.timestamp = timestamp;
		this.output = output;
		this.error=error;
		this.language = language;
	}

	public Boolean getSuccess() {
		return success;
	}

	public void setSuccess(Boolean success) {
		this.success = success;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}
	
}
