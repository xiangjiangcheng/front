package com.front.maven.springmvc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.TitleMapper;
import com.front.maven.springmvc.domain.Title;
import com.front.maven.springmvc.service.TitleService;
@Service
public class TitleServiceImpl implements TitleService {

	@Resource
	TitleMapper titleMapper;
	@Override
	public Title geTitle() {
		Title title = titleMapper.getTitle();
		return title;
	}
	@Override
	public Title geTitleByGroupid(String groupid) {
		Title title = titleMapper.selectByGroupid(groupid);
		return title;
	}
	@Override
	public Title getErjiTitleByGroupid(String groupid) {
		Title title = titleMapper.selecterjiByGroupid(groupid);
		return title;
	}

	
}
