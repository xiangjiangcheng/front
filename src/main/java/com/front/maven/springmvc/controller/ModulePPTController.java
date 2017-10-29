package com.front.maven.springmvc.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.front.maven.springmvc.domain.ModulePpt;
import com.front.maven.springmvc.service.ModulePPTService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("module")
public class ModulePPTController {

	@Resource
	private ModulePPTService modulePPTService;

	/**
	 * 查询ppt
	 * @param filename
	 * @param groupid
	 * @param menuid
	 * @return
	 */
	@RequestMapping("QueryFlash")
	@ResponseBody
	public Map<String, Object> QueryFlash(String groupid){
		System.out.println(groupid);
		ModulePpt modulePpt = new ModulePpt();
		Map<String, Object> map = new HashMap<>();
		modulePpt = modulePPTService.getByGroupId(groupid);
		map.put("modulePpt", modulePpt);
		return map;
	}
}
