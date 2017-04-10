package com.xzit.ar.common.mapper.info;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.page.Page;
import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;

public interface CommentMapper extends BaseMapper {

	/**
	 * TODO　加载信息的所有评论
	 * @param infoId
	 * @return
	 */
	public List<Map<String, Object>> loadInfoComment(@Param("infoId") Integer infoId);

	/**
	 * TODO 动态加载评论列表
	 * @param page
	 * @param infoId
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> dynamicLoadComment(Page<Map<String, Object>> page, @Param("infoId") Integer infoId) throws Exception;
}