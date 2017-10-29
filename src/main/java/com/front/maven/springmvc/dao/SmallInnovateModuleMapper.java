package com.front.maven.springmvc.dao;

import org.apache.ibatis.annotations.Select;

import com.front.maven.springmvc.domain.SmallInnovateModule;

public interface SmallInnovateModuleMapper {
    int deleteByPrimaryKey(String id);

    int insert(SmallInnovateModule record);

    int insertSelective(SmallInnovateModule record);

    SmallInnovateModule selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SmallInnovateModule record);

    int updateByPrimaryKey(SmallInnovateModule record);
    
    @Select("select * from small_innovate_module where groupid = #{groupid} and dlt = 0")
	SmallInnovateModule getSModuleByGid(String groupid);
}