package com.front.maven.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.front.maven.springmvc.domain.Group;

public interface GroupMapper {
    int deleteByPrimaryKey(String id);

    int insert(Group record);

    int insertSelective(Group record);

    Group selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Group record);

    int updateByPrimaryKey(Group record);
    
    @Select("select * from `group` where dlt=0")
	List<Group> getAllGroups();
}