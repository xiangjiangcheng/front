package com.front.maven.springmvc.service;

import java.util.List;

import com.front.maven.springmvc.domain.AlbumImg;


public interface AlbumImgService {
	
	List<AlbumImg> getByAlbumid(String albumid);

}
