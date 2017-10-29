package com.front.maven.springmvc.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.front.maven.springmvc.dao.AlbumMapper;
import com.front.maven.springmvc.domain.Album;
import com.front.maven.springmvc.service.AlbumService;


@Service
public class AlbumServiceImpl implements AlbumService {

	@Resource
	private AlbumMapper albumMapper;

	@Override
	public List<Album> getAllByGroupid(String groupid) {
		List<Album> albums = albumMapper.selectALLByGroupid(groupid);
		return albums;
	}

	
	
}
