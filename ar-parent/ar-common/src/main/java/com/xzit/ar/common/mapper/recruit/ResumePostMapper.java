package com.xzit.ar.common.mapper.recruit;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.po.recruit.ResumePost;

public interface ResumePostMapper extends BaseMapper {

	/**
	 * TODO 加载招聘信息的简历投递记录
	 * @param recruitId
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> postResumeRecord(@Param("recruitId") Integer recruitId) throws Exception;

	/**
	 * TODO 
	 * @param resumePost
	 * @return
	 */
	List<Map<String, Object>> checkResumeRecord(ResumePost resumePost);

	int recoverResumeRecord(ResumePost resumePost);

	int cancelResumeRecord(ResumePost resumePost);
}