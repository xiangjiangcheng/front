package com.front.maven.springmvc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.front.maven.springmvc.domain.ModuleTable;

public interface ModuleTableMapper {
    ModuleTable selectByPrimaryKey(String id);

    /**
     * 根据menuid和groupuid，查询对应的数据
     * @param groupid
     * @param menuid
     * @return
     */
    @Select("select * from module_table where groupid=#{groupid} and menuid=#{menuid} and dlt=0 ORDER BY YEAR DESC,MONTH DESC,DAY DESC")
    List<ModuleTable> getModuleTableByMeneId(@Param("groupid") String groupid,@Param("menuid") String menuid);

	ModuleTable getModuleTableByMenuAndMonth(@Param("menuid")String menuid, @Param("year")Integer year, @Param("month")Integer month,@Param("day")Integer day,@Param("week")Integer week);
	
	List<ModuleTable> getModuleTableByMenuId(@Param("menuid") String menuid);
}