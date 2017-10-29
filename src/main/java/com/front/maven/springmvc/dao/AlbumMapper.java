package com.front.maven.springmvc.dao;

import java.util.List;

import com.front.maven.springmvc.domain.Album;

public interface AlbumMapper {
    int deleteByPrimaryKey(String id);

    int insert(Album record);

    int insertSelective(Album record);

    Album selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Album record);

    int updateByPrimaryKey(Album record);
    /**
     * 查询所有的相册
     * @return
     */
    List<Album> selectALLByGroupid(String groupid);
}