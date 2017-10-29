package com.front.maven.springmvc.dao;

import com.front.maven.springmvc.domain.Icon;

public interface IconMapper {
    int deleteByPrimaryKey(String id);

    int insert(Icon record);

    int insertSelective(Icon record);

    Icon selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Icon record);

    int updateByPrimaryKey(Icon record);
}