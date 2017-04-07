package com.xzit.ar.common.mapper.info;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;

public interface InformationMapper extends BaseMapper {

	/**
	 * TODO 按组织类型和组织id查询信息
	 * @param infoType
	 * @param originId
	 * @param infoNum
	 * @return
	 */
	List<Map<String, Object>> loadOriginInfos(@Param("infoType") String infoType, @Param("originId") Integer originId,
			@Param("infoNum") Integer infoNum) throws Exception;

	/**
	 * TODO 加载特定组织成员发布的消息
	 * @param page
	 * @param userId
	 * @param originId
	 * @param infoType
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> loadOriginUserInfos(Page<Map<String, Object>> page, @Param("userId") Integer userId,
			@Param("originId") Integer originId, @Param("infoType") String infoType) throws Exception;

	/**
	 * TODO 增加消息评论数
	 * @param infoId
	 * @return
	 */
	Integer increaseCommentNum(@Param("infoId") Integer infoId) throws Exception;

	
}