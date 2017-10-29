package com.front.maven.springmvc.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.front.maven.springmvc.domain.ModuleRich;
import com.front.maven.springmvc.service.ModuleRichService;

@Controller
@RequestMapping("moduleRich")
public class ModuleRichController {

	@Resource
	private ModuleRichService moduleRichService;

	@RequestMapping("showGuichengzhidu")
	public String showGuichengzhidu(HttpServletRequest request,Model model){
		String id = request.getParameter("id");
		String menuid="";
		if (id.isEmpty()) {
			menuid= (String) request.getSession().getAttribute("menuid");
		} else {
			menuid=id;
		}
		ModuleRich moduleRich = moduleRichService.getById(menuid);
		model.addAttribute("moduleRich", moduleRich);
		return "front/guichengzhidu";
	}
	
	
}
