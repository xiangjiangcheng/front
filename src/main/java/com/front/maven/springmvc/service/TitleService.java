package com.front.maven.springmvc.service;

import com.front.maven.springmvc.domain.Title;

public interface TitleService {

	Title geTitle();
	
	Title geTitleByGroupid(String groupid);
	
	Title getErjiTitleByGroupid(String groupid);
}
