package com.xzit.ar.manage.service.origin;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.origin.Origin;
import com.xzit.ar.common.po.user.User;

import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/18 22:34.
 */
public interface OriginService {

    /**
     * TODO 条件查询组织
     * @param page
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> queryOrigin(Page<Map<String, Object>> page) throws ServiceException;

    /**
     * TODO 新建组织
     * @param origin
     * @return
     * @throws ServiceException
     */
    Integer saveOrigin(Origin origin) throws ServiceException;

    /**
     * TODO 更新组织信息
     * @param origin
     * @return
     * @throws ServiceException
     */
    Integer updateOrigin(Origin origin) throws ServiceException;

    /**
     * TODO 通过 originId 获取origin信息
     * @param originId
     * @return
     * @throws ServiceException
     */
    Map<String, Object> getOriginById(Integer originId) throws ServiceException;

    /**
     * TODO 获取组织成员列表
     * @param originId
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> getOriginMembers(Page<Map<String, Object>> page, Integer originId) throws ServiceException;
}
