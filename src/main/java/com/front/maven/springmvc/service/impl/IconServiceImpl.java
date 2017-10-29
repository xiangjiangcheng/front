package com.front.maven.springmvc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.IconMapper;
import com.front.maven.springmvc.domain.Icon;
import com.front.maven.springmvc.service.IconService;
@Service
public class IconServiceImpl implements IconService {

	@Resource
	private IconMapper iconMapper;
	@Override
	public Icon getById(String id) {
		Icon icon = iconMapper.selectByPrimaryKey(id);
		return icon;
	}

}
