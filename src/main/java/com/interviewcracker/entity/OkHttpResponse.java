package com.interviewcracker.entity;

import java.util.Date;

public class OkHttpResponse {

	private Boolean success;
	private Date timestamp;
	private String output;
	private String error;
	private String language;
	private String version;

	public OkHttpResponse() {
	}

	public OkHttpResponse(Boolean success,Date timestamp,String output,String error,String language, String version) {
		this.success = success;
		this.timestamp = timestamp;
		this.output = output;
		this.error=error;
		this.language = language;
		this.version = version;
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

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}
	
}
