package com.front.maven.springmvc.dao;

import java.util.List;

import com.front.maven.springmvc.domain.Excel;


public interface ExcelMapper {

    Excel selectByPrimaryKey(String id);

    List<Excel> getAllExcelModel();
    
    Excel getModuleByMenuId(String menuid);

}