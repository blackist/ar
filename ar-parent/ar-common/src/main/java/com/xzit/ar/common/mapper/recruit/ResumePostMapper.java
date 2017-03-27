package com.xzit.ar.common.mapper.recruit;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.po.recruit.ResumePost;

public interface ResumePostMapper extends BaseMapper {

	List<Map<String, Object>> postResumeRecord(@Param("recruitId") Integer recruitId);
	
	List<Map<String, Object>> checkResumeRecord(ResumePost resumePost);

	int recoverResumeRecord(ResumePost resumePost);

	int cancelResumeRecord(ResumePost resumePost);
}