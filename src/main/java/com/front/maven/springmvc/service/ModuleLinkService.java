package com.front.maven.springmvc.service;

import java.util.List;

import com.front.maven.springmvc.domain.ModuleLink;

public interface ModuleLinkService {

	List<ModuleLink> getByGroupidAndMenuid(String groupid,String menuid);
	
	ModuleLink getModuleLinkByMenuid(String menuid);
}
