package com.front.maven.springmvc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.BackgroundMapper;
import com.front.maven.springmvc.domain.Background;
import com.front.maven.springmvc.service.BackgroundService;
@Service
public class BackgroundServiceImpl implements BackgroundService {

	@Resource
	private BackgroundMapper backgroundMapper;
	@Override
	public Background getById(String id) {
		Background background = backgroundMapper.selectByPrimaryKey(id);
		return background;
	}

}
