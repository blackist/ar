package com.xzit.ar.common.mapper.user;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;

public interface UserResumeMapper extends BaseMapper {

	/**
	 * @Description TODO  加载用户简历列表
	 * @param userId
	 * @return List<Resume>
	 * @throws Exception
	 */
	List<Map<String, Object>> getResumes(@Param("userId") Integer userId) throws Exception;

	/**
	 * TODO 当用户向某个招聘信息
	 * @param resumeId
	 * @return
	 * @throws Exception
	 */
	int addResumePost(@Param("resumeId") Integer resumeId) throws Exception;
}