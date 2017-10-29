package com.front.maven.springmvc.dao;

import com.front.maven.springmvc.domain.ModulePpt;

public interface ModulePptMapper {
    int deleteByPrimaryKey(String id);

    int insert(ModulePpt record);

    int insertSelective(ModulePpt record);

    ModulePpt selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ModulePpt record);

    int updateByPrimaryKey(ModulePpt record);
    ModulePpt selectByGroupId(String groupid);
}