package com.front.maven.springmvc.controller;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.front.maven.springmvc.domain.Excel;
import com.front.maven.springmvc.domain.ModuleTable;
import com.front.maven.springmvc.service.ModuleTableService;
import com.front.maven.springmvc.util.ReadExcelUtil;

@Controller
@RequestMapping("moduletable")
public class ModuleTableController {

	@Resource
	private ModuleTableService moduleTableServiceImpl;
	
	
	/**
	 * 统一的简单模板
	 * @param menuid
	 * @param years
	 * @param month
	 * @param request
	 * @return
	 */
	@RequestMapping("previewPlan")
	@ResponseBody
	public Map<String, Object> previewPlan(ModuleTable moduleTable,HttpServletRequest request){
		//根据menuid,years,month,week查询出对应的信息
		Map<String, Object> map=new HashMap<String, Object>();
		try {
			ModuleTable myModuleTable=moduleTableServiceImpl.getModuleTableByMenuAndMonth(moduleTable.getMenuid(),moduleTable.getYear(),moduleTable.getMonth(),moduleTable.getDay(),moduleTable.getWeek());
			if(StringUtils.equalsIgnoreCase("true", moduleTable.getFirsttime())){
				if(myModuleTable == null || StringUtils.isBlank(myModuleTable.getFileName())){
					List<ModuleTable> list = moduleTableServiceImpl.getModuleTableByMenuId(moduleTable.getMenuid());
					for(ModuleTable table : list){
						String fileName=table.getFileName();
						Excel excel=moduleTableServiceImpl.getExcelById(table.getExcelid());
						String filePath=request.getServletContext().getRealPath("/")+"../display/static/ExcelUpload/"+fileName;
						ReadExcelUtil excelReader = new ReadExcelUtil(filePath);
						if(excelReader.getWb() == null || excelReader.getWb().getSheetAt(0) == null){
							continue;
						}
						System.out.println("table remark" + table.getRemark());
						int i=excel.getStartrow(),j=excel.getStartcol();//解析表格的开始行和开始列
						map=ReadExcelUtil.readExcel(filePath,i,j);
						map.put("showTitle", table.getRemark());
						return map;
					}
				}
			}
			String fileName=myModuleTable.getFileName();
			Excel excel=moduleTableServiceImpl.getExcelById(myModuleTable.getExcelid());
			String filePath=request.getServletContext().getRealPath("/")+"../display/static/ExcelUpload/"+fileName;
			int i=excel.getStartrow(),j=excel.getStartcol();//解析表格的开始行和开始列
			map=ReadExcelUtil.readExcel(filePath,i,j);
			map.put("showTitle", myModuleTable.getRemark());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	
	/**
	 * 根据时间区间去查询表格中的数据============待修改
	 * @param timeStart
	 * @param timeEnd
	 * @param menuid
	 * @param request
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping("previewExcelBystartAndEnd")
	@ResponseBody
	public Map<String, Object> previewExcelBystartAndEnd(String timeStart,String timeEnd,String menuid, String firsttime, HttpServletRequest request) throws ParseException{
		
		Map<String, Object> map=new HashMap<String, Object>();
		if(StringUtils.isBlank(timeStart) && StringUtils.isBlank(timeEnd) && StringUtils.equalsIgnoreCase("true", firsttime)){
			List<ModuleTable> list = moduleTableServiceImpl.getModuleTableByMenuId(menuid);
			if(!list.isEmpty()){
				for(ModuleTable table : list)
				if(table!=null){
					String fileName=table.getFileName();
					Excel excel=moduleTableServiceImpl.getExcelById(table.getExcelid());
					String filePath=request.getServletContext().getRealPath("/")+"../display/static/ExcelUpload/"+fileName;
					ReadExcelUtil excelReader = new ReadExcelUtil(filePath);
					if(excelReader.getWb() == null || excelReader.getWb().getSheetAt(0) == null){
						continue;
					}
					int z=excel.getStartrow(),x=excel.getStartcol();//解析表格的开始行和开始列
					map=ReadExcelUtil.readExcel(filePath,z,x);
					map.put("showTitle", table.getRemark());
					return map;
				}
			}
		}
		//日期录入的格式是yyyy-MM-dd，而timestamp转换的类型许yyyy-MM-dd HH:mm:ss
		//需要进行类型转换
		String dateMate="yyyy-MM-dd";
		
		//初始化结束时间为今天，但如果结束时间不为空，就将其赋值
		Timestamp myEndTime= new Timestamp(new Date().getTime());
		if(StringUtils.isNotBlank(timeEnd)){//如果结束时间不为空
			//获取截至日期的时间戳
			myEndTime=this.turnStringToData(timeEnd, dateMate);
		}
		Timestamp myStartTime=null;
		long days=7;
		//如果开始时间不为空
		if(StringUtils.isNotBlank(timeStart)){
			myStartTime=this.turnStringToData(timeStart, dateMate);
			days=(myEndTime.getTime()-myStartTime.getTime())/(1000 * 60 * 60 * 24); //获取选择的天数的差值
		}
		//再获取开始日期的时间戳
		for(int i=0;i<(int) days;i++){
			long dayMinis=myEndTime.getTime()-(1000 * 60 * 60 * 24*i);//减去对应的天数
			Date myDate=new Date(dayMinis);
			DateFormat changeMat=new SimpleDateFormat("yyyy-MM-dd");
			String myDates=changeMat.format(myDate);
			System.out.println(myDates);//获取到日期了
			String[] end=myDates.split("-");
			int	year=Integer.valueOf(end[0]);
			int	month=Integer.valueOf(end[1]);
			int	day=Integer.valueOf(end[2]);
			ModuleTable myModuleTable=moduleTableServiceImpl.getModuleTableByMenuAndMonth(menuid,year,month,day,null);
			if(myModuleTable!=null){
				String fileName=myModuleTable.getFileName();
				Excel excel=moduleTableServiceImpl.getExcelById(myModuleTable.getExcelid());
				String filePath=request.getServletContext().getRealPath("/")+"../display/static/ExcelUpload/"+fileName;
				int z=excel.getStartrow(),x=excel.getStartcol();//解析表格的开始行和开始列
				map=ReadExcelUtil.readExcel(filePath,z,x);
				map.put("showTitle", myModuleTable.getRemark());
				break;
			}
		}
		return map;
	}
	
	public Timestamp turnStringToData(String dateString,String dateFormate) throws ParseException{
		DateFormat dateFormat=new SimpleDateFormat(dateFormate);
		Date myDate=dateFormat.parse(dateString);
		Timestamp myTimestamp=new Timestamp(myDate.getTime());//得到当前时间的long型值
		return myTimestamp;
	}
	
	
	
}
