package com.front.maven.springmvc.service;

import java.util.List;

import com.front.maven.springmvc.domain.AdvancedShow;

public interface AdvancedShowService {
	// 分页查询信息，condition是成员名称
	public List<AdvancedShow> QueryData(String condition, String groupid);
	
	// 根据班组id获取
	public List<AdvancedShow> getAdvancedShowByGid(String groupid);

	public boolean addAdvancedShow(AdvancedShow AdvancedShow);

	public boolean updateAdvancedShow(AdvancedShow AdvancedShow);

	public boolean delete(String id); //删除微创新

	public AdvancedShow getAdvancedShowByid(String id);
	
}
