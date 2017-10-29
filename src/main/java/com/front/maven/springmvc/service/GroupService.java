package com.front.maven.springmvc.service;

import java.util.List;

import com.front.maven.springmvc.domain.Group;

public interface GroupService {
	// 得到所有的班组
	List<Group> getAllGroups();
}
