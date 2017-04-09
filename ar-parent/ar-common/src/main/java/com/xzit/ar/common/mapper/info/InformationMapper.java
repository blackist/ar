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
	public List<Map<String, Object>> loadOriginInfos(@Param("infoType") String infoType, @Param("originId") Integer originId,
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
	public List<Map<String, Object>> loadOriginUserInfos(Page<Map<String, Object>> page, @Param("userId") Integer userId,
			@Param("originId") Integer originId, @Param("infoType") String infoType) throws Exception;

	/**
	 * TODO 增加消息评论数
	 * @param infoId
	 * @return
	 */
	public Integer increaseComments(@Param("infoId") Integer infoId) throws Exception;

	/**
	 * TODO 增加喜欢数
	 * @param infoId
	 * @return
	 * @throws Exception
	 */
	public Integer increaseLoves(@Param("infoId") Integer infoId) throws Exception;

	/**
	 * TODO 累计浏览量
	 * @param infoId
	 * @return
	 * @throws Exception
	 */
	public Integer increaseViews(@Param("infoId") Integer infoId) throws Exception;

	/**
	 * TODO 根据条件查询信息列表
	 * @param page 分页类
	 * @param userId 用户id
	 * @param originId 组织id
	 * @param infoType 信息类型
	 * @param theme 信息主题
	 * @param queryStr 模糊查询条件
	 * @param state 信息状态
	 * @return 信息列表
	 * @throws Exception
	 */
	public List<Map<String, Object>> queryInfos(Page<Map<String, Object>> page, @Param("queryStr") String queryStr, @Param("infoType") String infoType,
										 @Param("theme") String theme, @Param("state") String state);

	/**
	 * TODO 根据info_id查询信息、作者、组织的详细信息
	 * @param infoId
	 * @return Map<String, Object> info
	 * @throws Exception
	 */
	public Map<String, Object> getInfoDetailById(@Param("infoId") Integer infoId) throws Exception;
}