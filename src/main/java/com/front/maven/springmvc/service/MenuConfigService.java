package com.front.maven.springmvc.service;

import java.util.List;

import com.front.maven.springmvc.domain.MenuConfig;
import com.front.maven.springmvc.domain.extend.MenuConfigExtend;

public interface MenuConfigService {
	List<MenuConfig> getMenuConfigByGroupid(String groupid);
	
	List<MenuConfig> getErjiByGroupid(String groupid);

	List<MenuConfigExtend> getNextPageByMenuId(String menuid);
	
	MenuConfig getMenuConfigById(String menuid);
	
	MenuConfig getMenuConfigRichById(String id);
}
