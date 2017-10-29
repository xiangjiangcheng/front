package com.front.maven.springmvc.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.ModulePptMapper;
import com.front.maven.springmvc.domain.ModulePpt;
import com.front.maven.springmvc.service.ModulePPTService;

@Service
public class ModulePPTServiceImpl implements ModulePPTService {

	@Resource
	private ModulePptMapper modulePptMapper;

	@Override
	public ModulePpt getByGroupId(String groupid) {
		ModulePpt modulePpt = modulePptMapper.selectByGroupId(groupid);
		return modulePpt;
	}
	
}
