package com.front.maven.springmvc.service;

import java.util.List;

import com.front.maven.springmvc.domain.ModuleRich;

public interface ModuleRichService {

	List<ModuleRich> getModuleRichByGroupid(String groupid,String menuid);
	
	ModuleRich getById(String id);
}
