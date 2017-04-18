package com.xzit.ar.portal.service.org.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.origin.OriginMapper;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.org.OrgService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * TODO 组织业务类实现类
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/16 22:38.
 */
@Service("orgService")
public class OrgServiceImpl implements OrgService {

    @Resource
    private OriginMapper originMapper;

    /**
     * TODO 按类型、组织人数加载热度高的班级
     *
     * @param originType
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getPopOrgsByOriginType(String originType) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(originType)){
                // 按类型加载热度组织，加载排名前三的
                return originMapper.loadPopularOrigin(originType, 3);
            }
        } catch (Exception e) {
            throw new ServiceException("查新信息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 按组织类型加载最近加入该类型组织的校友
     *
     * @param originType
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getLatestMembersByOriginType(String originType) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(originType)){
                return originMapper.latestMembers(originType, 6);
            }
        } catch (Exception e) {
            throw new ServiceException("查询信息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 按userId、originType查询用户加入的组织
     * @param userId     当前用户的userId
     * @param originType 当前查询的组织的类型
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getMyOrgsByUserId(Integer userId, String originType) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(userId) && CommonUtil.isNotEmpty(originType)){
                // 加载当前用户加入的组织
                return originMapper.loadMyOrigin(originType, userId);
            }
        } catch (Exception e) {
            throw new ServiceException("查询信息时发生异常");
        }
        return null;
    }

    /**
     * TODO 按组织类型查询组织用户数
     *
     * @param originType
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer getOrgMemberByOriginType(String originType) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(originType)){
                return originMapper.countOriginMembersByType(originType);
            }
        } catch (Exception e) {
            throw new ServiceException("查询信息时发生异常");
        }
        return 0;
    }

    /**
     * TODO 按组织类型查询组织数量
     *
     * @param originType
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer getOrgNumByOriginType(String originType) throws ServiceException {
        try {
            // 组织类型非空，按类型查询组织数量
            if (CommonUtil.isNotEmpty(originType)){
                return originMapper.countOriginNumByType(originType);
            }
        } catch (Exception e) {
            throw new ServiceException("查询信息时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 按组织类型加载组织列表
     * @param originType
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getOriginByOriginType(String originType) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(originType)){
                return originMapper.loadOriginByOriginType(originType);
            }
        } catch (Exception e) {
            throw new ServiceException("加载校友组织时发生异常！");
        }
        return null;
    }


}
