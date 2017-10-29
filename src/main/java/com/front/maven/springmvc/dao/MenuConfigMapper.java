package com.front.maven.springmvc.dao;

import java.util.List;

import com.front.maven.springmvc.domain.MenuConfig;
import com.front.maven.springmvc.domain.extend.MenuConfigExtend;

public interface MenuConfigMapper {
    int deleteByPrimaryKey(String id);

    int insertSelective(MenuConfig record);

    MenuConfig selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(MenuConfig record);

    List<MenuConfig> getByGroupid(String groupid);
    
    List<MenuConfig> getErjiByGroupid(String groupid);

	List<MenuConfigExtend> getNextPageByMenuId(String menuid);
	
	MenuConfig selectById(String id);
}