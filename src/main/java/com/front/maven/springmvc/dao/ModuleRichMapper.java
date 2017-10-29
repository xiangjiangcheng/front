package com.front.maven.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.front.maven.springmvc.domain.ModuleRich;

public interface ModuleRichMapper {
    int deleteByPrimaryKey(String id);

    int insert(ModuleRich record);

    int insertSelective(ModuleRich record);

    ModuleRich selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(ModuleRich record);

    int updateByPrimaryKeyWithBLOBs(ModuleRich record);

    int updateByPrimaryKey(ModuleRich record);
    /**
     *更具班组id查询 
     * @param groupid
     * @return
     */
    List<ModuleRich> selectByGroupidMenuid(@Param("groupid")String groupid,@Param("menuid")String menuid);
    
    ModuleRich selectById(String id);
}