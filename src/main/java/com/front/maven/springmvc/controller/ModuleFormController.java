package com.front.maven.springmvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.front.maven.springmvc.domain.AdvancedShow;
import com.front.maven.springmvc.domain.Group;
import com.front.maven.springmvc.domain.SmallInnovateModule;
import com.front.maven.springmvc.domain.SmallInnovateWithBLOBs;
import com.front.maven.springmvc.service.AdvancedShowService;
import com.front.maven.springmvc.service.smallInnovateWithBLOBsService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 表单模板、微创新模块/先进展示模块
 * 
 * @author P1306521
 *
 */
@Controller
@RequestMapping("moduleform")
public class ModuleFormController {

	@Resource
	private smallInnovateWithBLOBsService smallInnovateWithBLOBsServiceImpl;
	@Resource 
	private AdvancedShowService advanceShowServiceImpl;

	/**
	 * 跳转到先进展示主页面
	 */
	@RequestMapping("toAdvancedShow")
	public String toAdvancedShow(HttpServletRequest request, Model model) {
		// 查询该小组的所有先进展示数据
		// 得到班组id
		String groupid = (String) request.getSession().getAttribute("groupid");
		List<AdvancedShow> adList = new ArrayList<AdvancedShow>();
		try {
			adList = advanceShowServiceImpl.getAdvancedShowByGid(groupid);
		} catch (Exception e) {
			
		}
		model.addAttribute("adList", adList);
		
		return "front/advancedShow/showAdvancedShowList";
	}
	
	/**
	/**
	 * 跳转到先进展示详情页面
	 */
	@RequestMapping("toAdvancedShowDetails/{id}")
	public String toUpdateAdvancedShow(HttpServletRequest request, Model model, @PathVariable("id") String id) {
		AdvancedShow advancedShow = new AdvancedShow();
		try {
			advancedShow = advanceShowServiceImpl.getAdvancedShowByid(id);
		} catch (Exception e) {
		}
		model.addAttribute("advancedShow", advancedShow);
		return "front/advancedShow/advancedShowDetail";
	}
	
	
	/**
	 * 跳转到微创新
	 */
	@RequestMapping("toSmallInnovateList")
	public String toSmallInnovate(HttpServletRequest request, Model model) {
		String menuid = null;
		List<SmallInnovateWithBLOBs> list = null;
		try {
			menuid = request.getParameter("menuid");
			list = smallInnovateWithBLOBsServiceImpl.QueryAllData(menuid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("smallInnovateList", list);
		return "front/smallInnovate/showSmallInnovateList";
	}
	
	/**
	 * 跳转到微创新详情页面
	 */
	@RequestMapping("toSmallInnovateDetails")
	public String toSmallInnovateDetails(HttpServletRequest request, Model model) {
		String groupid = null;
		String id = null;
		SmallInnovateModule smallInnovateModule = null;
		SmallInnovateWithBLOBs smallInnovate = null;
		Group group = null;
		String[] pStrings = null;
		List<String> pList = new ArrayList<String>();
		try {
			groupid = (String) request.getSession().getAttribute("groupid");
			id = request.getParameter("id"); // 微创新id
			// 得到该班组微创新的模板
			smallInnovateModule = smallInnovateWithBLOBsServiceImpl.getSModuleByGid(groupid);
			// 得到该班组的信息
			group = smallInnovateWithBLOBsServiceImpl.getGroupByGid(groupid);
			// 根据微创新id得到该条数据
			smallInnovate = smallInnovateWithBLOBsServiceImpl.getsmallInnovateWithBLOBsById(id);
			String pictureids = smallInnovate.getPictureids();
			// 切割字符串
			pStrings = pictureids.split(",");  
			for (int i = 0; i < pStrings.length; i++) {  
				System.out.println(pStrings[i]);  
				pList.add(i, pStrings[i]);
			} 
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("smallInnovate", smallInnovate);
		request.setAttribute("group", group);
		request.setAttribute("pList", pList);
		return "front/smallInnovate/smallInnovateModule"+smallInnovateModule.getModule(); // 跳转到对应的显示页面
	}
	
}
