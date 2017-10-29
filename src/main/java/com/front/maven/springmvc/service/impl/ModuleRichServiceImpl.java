package com.front.maven.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.ModuleRichMapper;
import com.front.maven.springmvc.domain.ModuleRich;
import com.front.maven.springmvc.service.ModuleRichService;
@Service
public class ModuleRichServiceImpl implements ModuleRichService {

	@Resource
	private ModuleRichMapper moduleRichMapper;

	@Override
	public List<ModuleRich> getModuleRichByGroupid(String groupid,String menu) {
		List<ModuleRich> moduleRichs = moduleRichMapper.selectByGroupidMenuid(groupid,menu);
		return moduleRichs;
	}

	@Override
	public ModuleRich getById(String id) {
		ModuleRich moduleRich = moduleRichMapper.selectById(id);
		return moduleRich;
	}
}
