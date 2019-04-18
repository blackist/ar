package com.xzit.ar.portal.service.org;

import com.xzit.ar.common.exception.ServiceException;

import java.util.List;
import java.util.Map;

/**
 * TODO 校友组织业务类
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/16 22:32.
 */
public interface OrgService {

    /**
     * TODO 按组织类型加载组织列表
     * @param originType
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> getOriginByOriginType(String originType) throws ServiceException;

    /**
     * TODO 按组织类型查询组织数量
     * @param originType
     * @return
     * @throws ServiceException
     */
    Integer getOrgNumByOriginType(String originType) throws ServiceException;

    /**
     * TODO 按组织类型查询组织用户数
     * @param originType
     * @return
     * @throws ServiceException
     */
    Integer getOrgMemberByOriginType(String originType) throws ServiceException;

    /**
     * TODO 按userId、originType查询用户加入的组织
     * @param userId  当前用户的userId
     * @param originType  当前查询的组织的类型
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> getMyOrgsByUserId(Integer userId, String originType) throws ServiceException;

    /**
     * TODO 按类型、组织人数加载热度高的班级
     * @param originType
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> getPopOrgsByOriginType(String originType) throws ServiceException;

    /**
     * TODO 按组织类型加载最近加入该类型组织的校友
     * @param originType
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> getLatestMembersByOriginType(String originType) throws ServiceException;
}
