package com.front.maven.springmvc.service;

import java.util.List;

import com.front.maven.springmvc.domain.Group;
import com.front.maven.springmvc.domain.SmallInnovateModule;
import com.front.maven.springmvc.domain.SmallInnovateWithBLOBs;

public interface smallInnovateWithBLOBsService {
	// 根据班组id获取该班组微创新已选择的模
	public SmallInnovateModule getSModuleByGid(String groupid);

	public List<SmallInnovateWithBLOBs> QueryAllData(String menuid);

	// 根据id查询微创新
	public SmallInnovateWithBLOBs getsmallInnovateWithBLOBsById(String id);

	public Group getGroupByGid(String groupid);

}
