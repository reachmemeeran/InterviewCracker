package com.interviewcracker.service;

import java.util.Comparator;
import java.util.Map;

public class ValueComparator implements Comparator<String> {
	
	Map<String, Integer> base;

    public ValueComparator(Map<String, Integer> base) {
        this.base = base;
    }

	@Override
	public int compare(String arg0, String arg1) {
		if(base!=null && arg0!=null && arg1!=null) {
			if (base.get(arg0) >= base.get(arg1)) {
	            return -1;
	        } else {
	            return 1;
	        }
		}
		return 0;
	}

}
