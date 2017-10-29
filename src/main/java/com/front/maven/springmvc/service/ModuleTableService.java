package com.front.maven.springmvc.service;

import java.util.List;

import com.front.maven.springmvc.domain.Excel;
import com.front.maven.springmvc.domain.ModuleTable;

public interface ModuleTableService {
	
	
	List<ModuleTable> getModuletable(String groupid,String menuid);
	
	/**
	 * 获取所有的表格目录
	 */
	List<Excel> getAllExcelModel();
	
	ModuleTable getModuleTableById(String id);
	
	Excel getExcelByMenuId(String menuid);

	Excel getExcelById(String excelid);

	ModuleTable getModuleTableByMenuAndMonth(String menuid, Integer year, Integer month, Integer day, Integer week);
	
	List<ModuleTable> getModuleTableByMenuId(String menuid);
}
