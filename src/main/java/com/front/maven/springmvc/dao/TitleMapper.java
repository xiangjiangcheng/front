package com.front.maven.springmvc.dao;

import com.front.maven.springmvc.domain.Title;

public interface TitleMapper {
    int deleteByPrimaryKey(String id);

    int insert(Title record);

    int insertSelective(Title record);

    Title selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Title record);

    int updateByPrimaryKey(Title record);
    
    Title getTitle();
    
    Title selectByGroupid(String groupid);
    
    Title selecterjiByGroupid(String groupid);
}