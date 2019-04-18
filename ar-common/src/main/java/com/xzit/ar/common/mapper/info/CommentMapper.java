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
	List<Map<String, Object>> loadInfoComment(@Param("infoId") Integer infoId);

	/**
	 * TODO 动态加载评论列表
	 * @param page
	 * @param infoId
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> dynamicLoadComment(Page<Map<String, Object>> page, @Param("infoId") Integer infoId) throws Exception;

	/**
	 * TODO 当信息被删除时，COmments同时被删除
	 * @param infoId
	 * @return 删除帖子的评论
	 * @throws Exception
	 */
	Integer deleteCommentByInfoId(@Param("infoId") Integer infoId) throws Exception;

	/**
	 * TODO 通过userId和commentId删除评论
	 * @param infoId
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	Integer deleteCommentByUserIdAndInfoId(@Param("commentId") Integer commentId, @Param("userId") Integer userId) throws Exception;
}