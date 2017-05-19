package com.xzit.ar.common.mapper.origin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;

public interface OriginMapper extends BaseMapper {

	/**
	 * TODO 查询班级列表
	 * @param page 分页类
	 * @param queryStr 查询条件
	 * @param selectStr 年级
	 * @param stateStr 班级状态条件
	 * @return 班级列表
	 * @throws Exception
	 */
	@SelectProvider(type = OriginProvider.class, method = "queryClasses")
	List<Map<String, Object>> queryClasses(Page<Map<String, Object>> page, @Param("queryStr") String queryStr,
			@Param("originGrade") String selectStr, @Param("state") String stateStr) throws Exception;

	/**
	 * TODO 查询加入班记录的总人数
	 * @param originType 组织类型（班级）
	 * @return 班级列表
	 * @throws Exception
	 */
	@SelectProvider(type = OriginProvider.class, method = "countOriginNumByType")
	Integer countOriginNumByType(@Param("originType") String originType) throws Exception;

	/**
	 * TODO 查询班级总数
	 * @param originType 组织类型（班级）
	 * @return
	 * @throws Exception
	 */
	@SelectProvider(type = OriginProvider.class, method = "countOriginMembersByType")
	Integer countOriginMembersByType(@Param("originType") String originType) throws Exception;

	/**
	 * TODO 加载用户加入的班级/校友组织
	 * @param originType  组织类型
	 * @param userId 用户ID
	 * @return 组织列表
	 * @throws Exception
	 */
	@SelectProvider(type = OriginProvider.class, method = "loadMyOrigin")
	List<Map<String, Object>> loadMyOrigin(@Param("originType") String originType, @Param("userId") Integer userId)
			throws Exception;

	/**
	 * TODO 按热度加载班级、校友组织
	 * @param originType 组织类型
	 * @param number  加载的数量
	 * @return
	 * @throws Exception
	 */
	@SelectProvider(type = OriginProvider.class, method = "loadPopularOrigin")
	List<Map<String, Object>> loadPopularOrigin(@Param("originType") String originType, @Param("number") Integer number)
			throws Exception;

	/**
	 * TODO  最新加入的用户
	 * @param originType  组织类型
	 * @param number 加载最新用户数量
	 * @return
	 * @throws Exception
	 */
	@SelectProvider(type = OriginProvider.class, method = "latestMembers")
	List<Map<String, Object>> latestMembers(@Param("originType") String originType, @Param("number") Integer number)
			throws Exception;

	/**
	 * TODO 累加班级成员数量
	 * @param originId 组织id
	 * @return  
	 * @throws Exception
	 */
	@SelectProvider(type = OriginProvider.class, method = "addOriginMemberNum")
	Integer addOriginMemberNum(@Param("originId") Integer originId) throws Exception;

	/**
	 * TODO 更改组织简介
	 * @param originId  组织ID
	 * @param originDesc  组织的描述
	 * @return
	 */
	@SelectProvider(type = OriginProvider.class, method = "updateOriginDesc")
	Integer updateOriginDesc(@Param("originId") Integer originId, @Param("originDesc") String originDesc);

	/**
	 * TODO 按组织类型加载组织
	 * @param originType
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> loadOriginByOriginType(@Param("originType") String originType) throws Exception;

	/**
	 * TODO 加载组织最近的动态消息
	 * @param page
	 * @param originId
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> getOriginInfosByType(Page<Map<String, Object>> page, @Param("originId") Integer originId,
											 @Param("infoType") String infoType) throws Exception;

	/**
	 * TODO 查询组织成员列表
	 * @param originId
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> getOriginMember(Page<Map<String, Object> > page, @Param("originId") Integer originId) throws Exception;

	/**
	 * TODO 查询组织成员通讯录列表
	 * @param page 分页类
	 * @param originId originId
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> getOriginDirectory(Page<Map<String, Object> > page, @Param("originId") Integer originId) throws Exception;

	/**
	 * TODO 条件查询组织
	 * @param page
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> queryOrigin(Page<Map<String, Object>> page) throws Exception;

	/**
	 * TODO 通过id查询组织详情
	 * @param originId
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> getOriginById(@Param("originId") Integer originId) throws Exception;
}