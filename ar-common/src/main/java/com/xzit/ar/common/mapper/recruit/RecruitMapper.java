package com.xzit.ar.common.mapper.recruit;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;

public interface RecruitMapper extends BaseMapper {

	/**
	 * @Title: queryRecruit
	 * @Description: TODO 招聘索引界面分页加载招聘信息
	 * @param @param page
	 * @param @param
	 *            queryStr
	 */
	List<Map<String, Object>> queryRecruit(Page<Map<String, Object>> page, @Param("queryStr") String queryStr)
			throws Exception;

	/**
	 * @Title: getDetailRecruit
	 * @Description: TODO 查询招聘详情
	 * @param @param
	 *            id
	 */
	Map<String, Object> getDetailRecruit(@Param("recruitId") Integer id) throws Exception;

	/**
	 * @Title: loadOtherRecruits
	 * @Description: TODO 加载招聘信息发布单位的其他招聘信息
	 * @param @param
	 *            unitId
	 * @param @param
	 *            recruitId
	 */
	List<Map<String, Object>> loadOtherRecruits(@Param("unitId") Integer unitId, @Param("recruitId") Integer recruitId)
			throws Exception;

	/**
	 * @Title: queryJob
	 * @Description: TODO 后台管理查询招聘信息
	 * @param @param page
	 * @param @param queryStr
	 */
	@SelectProvider(type=RecruitProvider.class,method="queryJob")
	List<Map<String, Object>> queryJob(Page<Map<String, Object>> page, @Param("queryStr") String queryStr, @Param("state") String state)
			throws Exception;

	/**
	 * TODO 用户向此招聘信息投递简历时，此招聘信息的简历投递数+1
	 * @param recruitId
	 * @return
	 * @throws Exception
	 */
	int addResumes(@Param("recruitId") Integer recruitId) throws Exception;

	/**
	 * TODO 查询用户发布的招聘信息
	 * @param page
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> getRecruitByUserId(Page<Map<String, Object>> page, @Param("userId") Integer userId)  ;
}