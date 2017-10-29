package com.front.maven.springmvc.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.front.maven.springmvc.domain.Album;
import com.front.maven.springmvc.domain.Background;
import com.front.maven.springmvc.domain.Excel;
import com.front.maven.springmvc.domain.Icon;
import com.front.maven.springmvc.domain.MenuConfig;
import com.front.maven.springmvc.domain.ModuleLink;
import com.front.maven.springmvc.domain.ModuleRich;
import com.front.maven.springmvc.domain.extend.MenuConfigExtend;
import com.front.maven.springmvc.service.AlbumImgService;
import com.front.maven.springmvc.service.AlbumService;
import com.front.maven.springmvc.service.BackgroundService;
import com.front.maven.springmvc.service.IconService;
import com.front.maven.springmvc.service.MenuConfigService;
import com.front.maven.springmvc.service.ModuleLinkService;
import com.front.maven.springmvc.service.ModuleRichService;
import com.front.maven.springmvc.service.ModuleTableService;
import com.front.maven.springmvc.service.impl.ModuleRichServiceImpl;

/**
 * 
 * @author pan.zhu
 * @DATE 2017-04-17 10:33:37
 *
 */
@Controller
@RequestMapping("page")
public class PageController {

	@Resource
	private MenuConfigService menuConfigServiceImpl;

	@Resource
	private BackgroundService backgroundServiceImpl;

	@Resource
	private IconService iconServiceImpl;

	@Resource
	private ModuleTableService moduleTableServiceImpl;

	@Resource
	private ModuleRichService moduleRichServiceImpl;

	@Resource
	private ModuleLinkService moduleLinkServiceImpl;
	
	@Resource
	private AlbumService albumService;
	
	@Resource
	private AlbumImgService albumImgService;

	/**
	 * 根绝MenuId查询二级目录
	 */
	@RequestMapping("getPageByMenuId")
	public String getPageByMenuId(HttpServletRequest request) {
		String backgroundersan = request.getParameter("background");
		String menuid = request.getParameter("menuid");
		//String groupid=(String) request.getSession().getAttribute("groupid");
		//根据menuid和获取第二级的页面
		List<MenuConfigExtend> menuConfigs=menuConfigServiceImpl.getNextPageByMenuId(menuid);
		MenuConfig menuConfig = menuConfigServiceImpl.getMenuConfigById(menuid);
		String firstLevelTitle=menuConfig.getTitle();
		// 特殊菜单：微创新
		/*if (menuConfigs.get(0).getTitle().equals("微创新")) {
			//return "front/smallInnovate/showSmallInnovateList";
			request.setAttribute("menuid", menuConfigs.get(0).getId());
			return "forward:/rest/moduleform/toSmallInnovateList";
		}*/
		if (menuConfigs.size() == 1) {// 没有父Id了，证明其是一个页面了
			 String secondLevelTitle=menuConfigs.get(0).getTitle();
			 
			 if(secondLevelTitle.equalsIgnoreCase(firstLevelTitle)){
				 String url = menuConfig.getUrl();
				 if (StringUtils.isNotBlank(url)) {// 如果url不为空，则证明其是一个页面
					 //return "forward:/rest/" + url + "?menuid";
					 request.setAttribute("menuid", menuConfig.getId());
					 request.setAttribute("title", secondLevelTitle);
					 return "forward:/rest/" + url;
				 } else {// 如果url为空，就证明其是一个链接
					 ModuleLink link = moduleLinkServiceImpl.getModuleLinkByMenuid(menuid);
					 String myLink = link.getUrl();
					 request.setAttribute("link", myLink);
					 request.setAttribute("title", secondLevelTitle);
					 return "front/link";
				}
			 } else {
				 for (MenuConfigExtend menu : menuConfigs) {
						// 获取背景图片的名称
						Background background = backgroundServiceImpl.getById(menu.getBackgroundid());
						menu.setBackgroundname(background.getBgname());
						// 获取图标的名称
						Icon icon = iconServiceImpl.getById(menu.getIconid());
						menu.setIconname(icon.getIconname());
					}

					request.setAttribute("menuConfig", menuConfigs);
					request.setAttribute("backgroundersan", backgroundersan);
					return "front/nextPageFromMenu";
			 }
			
		} else {
			// 循环出背景和Icon的名称
			for (MenuConfigExtend menu : menuConfigs) {
				// 获取背景图片的名称
				Background background = backgroundServiceImpl.getById(menu.getBackgroundid());
				menu.setBackgroundname(background.getBgname());
				// 获取图标的名称
				Icon icon = iconServiceImpl.getById(menu.getIconid());
				menu.setIconname(icon.getIconname());
			}

			request.setAttribute("menuConfig", menuConfigs);
			request.setAttribute("firstLevelTitle", firstLevelTitle);
			request.setAttribute("backgroundersan", backgroundersan);
			return "front/nextPageFromMenu";
		}
	}

	/**
	 * 查看计划总结页面,在front里面显示显示详细信息,这是一个Excel,然后根据menuid去解析Excel
	 * 
	 * @return
	 */
	@RequestMapping("showPlanList")
	public String showPlanList(HttpServletRequest request) {
		String groupid = (String) request.getSession().getAttribute("groupid");
		String menuid = request.getParameter("menuid");// 获取到MenuId后，根据MenuId到Table表查询
		request.setAttribute("menuid", menuid);
		return "front/workPlan";
	}
	
	/**
	 * 查看工作总结的页面
	 * @param request
	 * @return
	 */
	@RequestMapping("showSummaryList")
	public String showSummaryList(HttpServletRequest request) {
		String menuid = request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "front/workSummary";
	}

	/**
	 * 查看员工动态的页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("showDynamicList")
	public String showDynamicList(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "front/showDynamicExcel";
	}
	/**
	 * 查看绩效考核的页面
	 * @param request
	 * @return
	 */
	@RequestMapping("showCheckList")
	public String showCheckList(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "front/showCheckExcel";
	}
	/**
	 * 查看员工考勤的页面
	 * @param request
	 * @return
	 */
	@RequestMapping("showAttendanceList")
	public String showAttendanceList(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "front/showAttendanceExcel";
	}
	@RequestMapping("showTrainList")
	public String showTrainList(HttpServletRequest request){
		String menuid=request.getParameter("menuid");
		request.setAttribute("menuid", menuid);
		return "front/showTrainExcel";
	}
	/**
	 * 查看富文本
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("ruleManange")
	public String showRuleManage(HttpServletRequest request, Model model) {
		String id = request.getParameter("menuid");
		MenuConfig config = menuConfigServiceImpl.getMenuConfigRichById(id);
		String groupid = config.getGroupid();
		List<ModuleRich> moduleRichs = moduleRichServiceImpl.getModuleRichByGroupid(groupid, id);
		//如果只有一条数据，则直接跳转到显示页面
		if(moduleRichs.size()==1){
			ModuleRich moduleRich = moduleRichs.get(0);
			model.addAttribute("moduleRich", moduleRich);
			return "front/guichengzhidu";
		}else{
			//如果不止一条数据，则跳转到list页面，并且将list传到前台页面
			model.addAttribute("moduleRichs", moduleRichs);
			model.addAttribute("config", config);
			return "front/guichenglist";
		}
		
	}
	
	@RequestMapping("showPPT")
	public String  showPPT(HttpServletRequest request,Model model){
		String menuid = request.getParameter("menuid");
		String groupid = request.getParameter("groupid");
		model.addAttribute("menuid", menuid);
		model.addAttribute("groupid", groupid);
		return "forward:/uploadPPT.jsp";
	}
	
	@RequestMapping("showPhoto")
	public String  showPhotos(HttpServletRequest request,Model model){
		String menuid = (String) request.getSession().getAttribute("menuid");
		String groupid = (String) request.getSession().getAttribute("groupid");
		model.addAttribute("menuid", menuid);
		model.addAttribute("groupid", groupid);
		return "front/showPhotos";
	}
	
	@RequestMapping("showPhotoDetails")
	public String  showPhotoDetails(HttpServletRequest request,Model model){
		String menuid = request.getParameter("menuid");
		String groupid = request.getParameter("groupid");
		model.addAttribute("menuid", menuid);
		model.addAttribute("groupid", groupid);
		return "front/showPhotoDetails";
	}

}
