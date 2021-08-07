package com.xzit.ar.common.mapper.role;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.role.Right;

public interface RightMapper extends BaseMapper {

    /**
     * @param @param  rightId
     * @param @return
     * @return int
     * @throws
     * @Title: deleteByPrimaryKey
     * @Description: 删除权限
     */
    int deleteByPrimaryKey(Integer rightId);

    /**
     * @param @param  rightId
     * @param @return
     * @param @throws Exception
     * @return Right
     * @throws
     * @Title: selectById
     * @Description: 通过权限id 查询权限
     */
    Right selectById(@Param("rightId") Integer rightId) throws Exception;

    /**
     * @param @param  rightUrl
     * @param @return
     * @param @throws Exception
     * @return Right
     * @throws
     * @Title: selectByRightUrl
     * @Description: 通过url查询权限
     */
    Right selectByRightUrl(@Param("rightUrl") String rightUrl) throws Exception;

    /**
     * @param @return
     * @param @throws Exception
     * @return Map<String,Object>
     * @throws
     * @Title: selectTopPosCode
     * @Description: 查询最高权限位权限码
     */
    Map<String, Object> selectTopPosCode() throws Exception;

    /**
     * @param @param  page
     * @param @param  queryInput
     * @param @return
     * @param @throws Exception
     * @return List<Map<String,Object>>
     * @throws
     * @Title: queryRights
     * @Description: 查询权限
     */
    List<Map<String, Object>> queryRights(Page<Right> page, @Param("queryInput") String queryInput) throws Exception;

    /**
     * @param @return
     * @param @throws Exception
     * @return List<Right>
     * @throws
     * @Title: getAllRights
     * @Description: 加载所有权限
     */
    List<Right> getAllRights() throws Exception;

    /**
     * 获取非公开权限资源
     *
     * @return
     * @throws Exception
     */
    List<Right> getIsNotPublicRights() throws Exception;

}