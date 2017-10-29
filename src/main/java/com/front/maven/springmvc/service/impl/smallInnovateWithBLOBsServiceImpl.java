package com.front.maven.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.GroupMapper;
import com.front.maven.springmvc.dao.SmallInnovateMapper;
import com.front.maven.springmvc.dao.SmallInnovateModuleMapper;
import com.front.maven.springmvc.domain.Group;
import com.front.maven.springmvc.domain.SmallInnovateModule;
import com.front.maven.springmvc.domain.SmallInnovateWithBLOBs;
import com.front.maven.springmvc.service.smallInnovateWithBLOBsService;

@Service
public class smallInnovateWithBLOBsServiceImpl implements smallInnovateWithBLOBsService {
	@Resource
	private SmallInnovateMapper smallInnovateMapper;
	@Resource
	private SmallInnovateModuleMapper smallInnovateModuleMapper;
	@Resource
	private GroupMapper groupMapper;

	@Override
	public List<SmallInnovateWithBLOBs> QueryAllData(String menuid) {
		return smallInnovateMapper.QueryAllData(menuid);
	}

	@Override
	public SmallInnovateModule getSModuleByGid(String groupid) {
		return smallInnovateModuleMapper.getSModuleByGid(groupid);
	}

	@Override
	public SmallInnovateWithBLOBs getsmallInnovateWithBLOBsById(String id) {
		return smallInnovateMapper.selectByPrimaryKey(id);
	}

	@Override
	public Group getGroupByGid(String groupid) {
		return groupMapper.selectByPrimaryKey(groupid);
	}

}
