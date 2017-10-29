package com.front.maven.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.ExcelMapper;
import com.front.maven.springmvc.dao.ModuleTableMapper;
import com.front.maven.springmvc.domain.Excel;
import com.front.maven.springmvc.domain.ModuleTable;
import com.front.maven.springmvc.service.ModuleTableService;

@Service
public class ModuleTableServiceImpl implements ModuleTableService{
	
	@Resource
	private ModuleTableMapper moduleTableMapper;
	
	@Resource
	private ExcelMapper excelMapper;
	
	@Override
	public List<ModuleTable> getModuletable(String groupid, String menuid) {
		List<ModuleTable> moduleTables= moduleTableMapper.getModuleTableByMeneId(groupid,menuid);
		return moduleTables;
	}

	@Override
	public List<ModuleTable> getModuleTableByMenuId(String menuid) {
		List<ModuleTable> moduleTables= moduleTableMapper.getModuleTableByMenuId(menuid);
		return moduleTables;
	}

	@Override
	public List<Excel> getAllExcelModel() {
		List<Excel> excels=excelMapper.getAllExcelModel();
		return excels;
	}

	@Override
	public ModuleTable getModuleTableById(String id) {
		ModuleTable moduleTable=moduleTableMapper.selectByPrimaryKey(id);
		return moduleTable;
	}

	@Override
	public Excel getExcelByMenuId(String menuid) {
		Excel excel=excelMapper.getModuleByMenuId(menuid);
		return excel;
	}

	@Override
	public ModuleTable getModuleTableByMenuAndMonth(String menuid, Integer year, Integer month, Integer day, Integer week) {
		ModuleTable m =moduleTableMapper.getModuleTableByMenuAndMonth(menuid,year,month,day, week);
		return m;
	}

	@Override
	public Excel getExcelById(String excelid) {
		Excel excel=excelMapper.selectByPrimaryKey(excelid);
		return excel;
	}
	
	
}
