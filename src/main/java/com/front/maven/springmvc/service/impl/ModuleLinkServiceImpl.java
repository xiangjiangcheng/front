package com.front.maven.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.ModuleLinkMapper;
import com.front.maven.springmvc.domain.ModuleLink;
import com.front.maven.springmvc.service.ModuleLinkService;



@Service
public class ModuleLinkServiceImpl implements ModuleLinkService {

	@Resource
	private ModuleLinkMapper moduleLinkMapper;
	@Override
	public List<ModuleLink> getByGroupidAndMenuid(String groupid, String menuid) {
		List<ModuleLink> moduleLinks = moduleLinkMapper.selectByGroupidAndMenuid(groupid, menuid);
		return moduleLinks;
	}
	@Override
	public ModuleLink getModuleLinkByMenuid(String menuid) {
		ModuleLink moduleLink=moduleLinkMapper.getModuleLinkByMenuid(menuid);
		return moduleLink;
	}

}
