package com.front.maven.springmvc.service;

import java.util.List;

import com.front.maven.springmvc.domain.Album;


public interface AlbumService {

	List<Album> getAllByGroupid(String groupid);
}
