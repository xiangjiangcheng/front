package com.front.maven.springmvc.service;

import com.front.maven.springmvc.domain.Background;

public interface BackgroundService {
//通过id查询background
	Background getById(String id);
}
