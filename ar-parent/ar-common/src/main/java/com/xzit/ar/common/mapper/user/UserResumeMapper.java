package com.xzit.ar.common.mapper.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;

public interface UserResumeMapper extends BaseMapper {

	List<Map<String, Object>> loadPostResumes(@Param("userId") Integer userId) throws Exception;
}