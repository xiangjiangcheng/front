package com.front.maven.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.MenuConfigMapper;
import com.front.maven.springmvc.domain.MenuConfig;
import com.front.maven.springmvc.domain.extend.MenuConfigExtend;
import com.front.maven.springmvc.service.MenuConfigService;
@Service
public class MenuConfigServiceImpl implements MenuConfigService {

	@Resource
	private MenuConfigMapper menuConfigMapper;
	
	@Override
	public List<MenuConfig> getMenuConfigByGroupid(String groupid) {
		List<MenuConfig> menuConfigs = menuConfigMapper.getByGroupid(groupid);
		return menuConfigs;
	}

	@Override
	public List<MenuConfig> getErjiByGroupid(String groupid) {
		List<MenuConfig> menuConfigs = menuConfigMapper.getErjiByGroupid(groupid);
		return menuConfigs;
	}

	@Override
	public List<MenuConfigExtend> getNextPageByMenuId(String menuid) {
		return menuConfigMapper.getNextPageByMenuId(menuid);
	}

	@Override
	public MenuConfig getMenuConfigById(String menuid) {
		return menuConfigMapper.selectByPrimaryKey(menuid);
	}

	@Override
	public MenuConfig getMenuConfigRichById(String id) {
		MenuConfig menuConfig = menuConfigMapper.selectById(id);
		return menuConfig;
	}

}
