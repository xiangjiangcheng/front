package com.front.maven.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.front.maven.springmvc.domain.Album;
import com.front.maven.springmvc.domain.AlbumImg;
import com.front.maven.springmvc.service.AlbumImgService;
import com.front.maven.springmvc.service.AlbumService;

@RequestMapping("photo")
@Controller
public class PhotoController {

	@Resource
	private AlbumService albumService;
	
	@Resource
	private AlbumImgService albumImgService;
	
	@RequestMapping("showPhoto")
	@ResponseBody
	public Map<String, Object> showPhoto(@RequestParam("groupid") String groupid){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Album> albums = albumService.getAllByGroupid(groupid);
		for (int i = 0; i < albums.size(); i++) {
			String albumid = albums.get(i).getId();
			List<AlbumImg> albumImgs = albumImgService.getByAlbumid(albumid);
			
			if (albumImgs.size()>0) {
				albums.get(i).setRemark(albumImgs.size()+","+albumImgs.get(0).getFilename());
			}else{
				albums.get(i).setRemark("0");
			}
		}
		map.put("albums", albums);
		return map;
	}
	/**
	 * 跳转页面
	 * @param request
	 * @return
	 */
	@RequestMapping("showPhotoDetails")
	public String showPhotoDetil(HttpServletRequest request){
		String albumid = request.getParameter("id");
		//List<AlbumImg> albumImgs = albumImgService.getByAlbumid(albumid);
		request.setAttribute("albumid", albumid);
		return "front/showPhotoDetails";
	}
	/**
	 * 传送数据
	 */
	@RequestMapping("showPhotoDetil")
	@ResponseBody
	public Map<String, Object> showPhotosDetil(@RequestParam("albumid") String albumid){
		Map<String, Object> map = new HashMap<>();
		System.out.println("aaaaaaaaaaa"+albumid);
		List<AlbumImg> albumImgs = albumImgService.getByAlbumid(albumid);
		map.put("albumImgs", albumImgs);
		return map;
	}
}
