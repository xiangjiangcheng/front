package com.front.maven.springmvc.dao;

import java.util.List;

import com.front.maven.springmvc.domain.AlbumImg;

public interface AlbumImgMapper {
    int deleteByPrimaryKey(String id);

    int insert(AlbumImg record);

    int insertSelective(AlbumImg record);

    AlbumImg selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(AlbumImg record);

    int updateByPrimaryKey(AlbumImg record);
    
    List<AlbumImg> selectByAlbumid(String albumid);
}