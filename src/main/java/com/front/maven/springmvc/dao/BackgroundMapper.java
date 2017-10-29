package com.front.maven.springmvc.dao;

import com.front.maven.springmvc.domain.Background;

public interface BackgroundMapper {
    int deleteByPrimaryKey(String id);

    int insert(Background record);

    int insertSelective(Background record);

    Background selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Background record);

    int updateByPrimaryKey(Background record);
}