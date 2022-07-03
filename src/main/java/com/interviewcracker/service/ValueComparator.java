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
		if(base!=null) {
			Integer v1 = base.get(arg0);
			Integer v2 = base.get(arg1);
			if (v1 != null && v2 == null) {
		        return -1;
		    }
		    if (v1 == null && v2 != null) {
		        return 1;
		    }
			if (v1!=null && v2!=null && v1 > v2) {
	            return -1;
	        }else if(v1 == v2){
	        	return arg1.compareTo(arg0);
	        } else {
	            return 1;
	        }
		}
		return 1;
	}
	
}
