package com.front.maven.springmvc.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.front.maven.springmvc.domain.Background;
import com.front.maven.springmvc.domain.Group;
import com.front.maven.springmvc.domain.Icon;
import com.front.maven.springmvc.domain.MenuConfig;
import com.front.maven.springmvc.domain.Title;
import com.front.maven.springmvc.service.BackgroundService;
import com.front.maven.springmvc.service.GroupService;
import com.front.maven.springmvc.service.IconService;
import com.front.maven.springmvc.service.MenuConfigService;
import com.front.maven.springmvc.service.TitleService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("indexhome")
public class HomeController {

	@Resource
	private MenuConfigService menuConfigServiceImpl;
	@Resource
	private BackgroundService backgroundServiceImpl;
	@Resource
	private IconService iconServiceImpl;
	@Resource
	private TitleService titleServiceImpl;
	@Resource
	private GroupService groupService;

	/**
	 * 判断班组，显示什么页面
	 * 
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("judgebz/{id}")
	@ResponseBody
	public Map<String, Object> JudgeBz(@PathVariable("id") String id,
			Model model, HttpServletRequest request) {
		request.getSession().setAttribute("groupid", id);
		String backgroundid = "";
		String iconid = "";
		String title = "";
		MenuConfig menuConfig = new MenuConfig();
		Background background = new Background();
		Title title2 = new Title();
		Icon icon = new Icon();
		List<Object> list = new ArrayList<>(); // 返回结果
		List<Object> list2 = new ArrayList<>(); // 暂时存放
		Map<String, Object> map = new HashMap<String, Object>();
		List<MenuConfig> menuConfigs = menuConfigServiceImpl.getMenuConfigByGroupid(id);
		// 查询所有的小组信息
		List<Group> groupList = groupService.getAllGroups();
		for (int i = 0; i < menuConfigs.size(); i++) {
			menuConfig = menuConfigs.get(i);// 获取menuConfig
			backgroundid = menuConfig.getBackgroundid();
			iconid = menuConfig.getIconid();

			background = backgroundServiceImpl.getById(backgroundid);// 获取背景
			icon = iconServiceImpl.getById(iconid);// 获取icon

			list2.add(0, menuConfig);
			list2.add(1, background);
			list2.add(2, icon);

			// 放入返回的list中
			list.add(i, list2);
			// 清空
			list2 = new ArrayList<>();
		}
		title2 = titleServiceImpl.geTitleByGroupid(id);// 获取title
		String titlebackgroundid = title2.getBackgroundid();
		Background BigBackground = backgroundServiceImpl.getById(titlebackgroundid);

		try {
			map.put("ipAddress", InetAddress.getLocalHost().getHostAddress());
		} catch (Exception e) {
			e.printStackTrace();
		}
		map.put("nowgroupid", id);
		map.put("groupList", groupList);
		map.put("result", list);
		map.put("title", title2);
		map.put("BigBackground", BigBackground);
		return map;
	}

}
