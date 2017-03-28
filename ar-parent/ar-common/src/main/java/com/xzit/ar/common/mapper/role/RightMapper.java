package com.xzit.ar.common.mapper.role;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.role.Right;

public interface RightMapper extends BaseMapper {
	
	/**
	 * @Title: deleteByPrimaryKey
	 * @Description: TODO 删除权限
	 * @param @param rightId
	 * @param @return   
	 * @return int 
	 * @throws
	 */
	int deleteByPrimaryKey(Integer rightId);

	/**
	 * @Title: selectById
	 * @Description: TODO 通过权限id 查询权限
	 * @param @param rightId
	 * @param @return
	 * @param @throws Exception   
	 * @return Right 
	 * @throws
	 */
	Right selectById(@Param("rightId") Integer rightId) throws Exception;

	/**
	 * @Title: selectByRightUrl
	 * @Description: TODO 通过url查询权限
	 * @param @param rightUrl
	 * @param @return
	 * @param @throws Exception   
	 * @return Right 
	 * @throws
	 */
	Right selectByRightUrl(@Param("rightUrl") String rightUrl) throws Exception;

	/**
	 * @Title: selectTopPosCode
	 * @Description: TODO 查询最高权限位权限码
	 * @param @return
	 * @param @throws Exception   
	 * @return Map<String,Object> 
	 * @throws
	 */
	Map<String, Object> selectTopPosCode() throws Exception;

	/**
	 * @Title: queryRights
	 * @Description: TODO 查询权限
	 * @param @param page
	 * @param @param queryInput
	 * @param @return
	 * @param @throws Exception   
	 * @return List<Map<String,Object>> 
	 * @throws
	 */
	List<Map<String, Object>> queryRights(Page<Right> page, @Param("queryInput") String queryInput) throws Exception;

	/**
	 * @Title: getAllRights
	 * @Description: TODO 加载所有权限
	 * @param @return
	 * @param @throws Exception   
	 * @return List<Right> 
	 * @throws
	 */
	List<Right> getAllRights() throws Exception;
	
}