package com.xzit.ar.common.mapper.origin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;

public interface OriginMapper extends BaseMapper {

	@SelectProvider(type = OriginProvider.class, method = "queryClasses")
	List<Map<String, Object>> queryClasses(Page<Map<String, Object>> page, @Param("queryStr") String queryStr,
			@Param("originGrade") String selectStr, @Param("state") String stateStr) throws Exception;

	@SelectProvider(type = OriginProvider.class, method = "countOriginNumByType")
	Integer countOriginNumByType(@Param("originType") String originType) throws Exception;

	@SelectProvider(type = OriginProvider.class, method = "countOriginMembersByType")
	Integer countOriginMembersByType(@Param("originType") String originType) throws Exception;

	@SelectProvider(type = OriginProvider.class, method = "loadMyOrigin")
	List<Map<String, Object>> loadMyOrigin(@Param("originType") String originType, @Param("userId") Integer userId)
			throws Exception;

	@SelectProvider(type = OriginProvider.class, method = "loadPopularOrigin")
	List<Map<String, Object>> loadPopularOrigin(@Param("originType") String originType, @Param("number") Integer number)
			throws Exception;

	@SelectProvider(type = OriginProvider.class, method = "latestMembers")
	List<Map<String, Object>> latestMembers(@Param("originType") String originType, @Param("number") Integer number)
			throws Exception;

	@SelectProvider(type = OriginProvider.class, method = "addOriginMemberNum")
	Integer addOriginMemberNum(@Param("originId") Integer originId) throws Exception;

	@SelectProvider(type = OriginProvider.class, method = "updateOriginDesc")
	Integer updateOriginDesc(@Param("originId") Integer originId, @Param("originDesc") String originDesc);
}