package com.front.maven.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.BackgroundMapper;
import com.front.maven.springmvc.dao.GroupMapper;
import com.front.maven.springmvc.domain.Background;
import com.front.maven.springmvc.domain.Group;
import com.front.maven.springmvc.service.BackgroundService;
import com.front.maven.springmvc.service.GroupService;
@Service
public class GroupServiceImpl implements GroupService {

	@Resource
	private GroupMapper groupMapper;
	 
	@Override
	public List<Group> getAllGroups() {
		return groupMapper.getAllGroups();
	}

}
