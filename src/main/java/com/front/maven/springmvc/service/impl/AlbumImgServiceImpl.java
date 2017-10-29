package com.front.maven.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.AlbumImgMapper;
import com.front.maven.springmvc.domain.AlbumImg;
import com.front.maven.springmvc.service.AlbumImgService;
import com.front.maven.springmvc.util.UUIDUtil;


@Service
public class AlbumImgServiceImpl implements AlbumImgService {

	@Resource
	private AlbumImgMapper albumImgMapper;

	@Override
	public List<AlbumImg> getByAlbumid(String albumid) {
		List<AlbumImg> albumImgs = albumImgMapper.selectByAlbumid(albumid);
		return albumImgs;
	}

	
}
