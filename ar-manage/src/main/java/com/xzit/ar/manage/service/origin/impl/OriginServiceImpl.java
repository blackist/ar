package com.xzit.ar.manage.service.origin.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.origin.GradeMapper;
import com.xzit.ar.common.mapper.origin.OriginMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.origin.Origin;
import com.xzit.ar.common.po.user.User;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.origin.OriginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/18 22:34.
 */
@Service("originService")
public class OriginServiceImpl implements OriginService {

    @Resource
    private OriginMapper originMapper;

    @Resource
    private GradeMapper gradeMapper;

    /**
     * TODO 条件查询组织
     *
     * @param page
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> queryOrigin(Page<Map<String, Object>> page) throws ServiceException {
        try {
            return originMapper.queryOrigin(page);
        } catch (Exception e) {
            throw new ServiceException("查询组织信息时发生异常！");
        }
    }

    /**
     * TODO 新建组织
     *
     * @param origin
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer saveOrigin(Origin origin) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(origin.getMgrId())) {
                originMapper.save(origin);
                // 若新增组织为班级，则年级的班级数加1
                if (origin.getOriginType().trim().equals("C") && CommonUtil.isNotEmpty(origin.getOriginGrade())) {
                    return gradeMapper.increaseClassNum(origin.getOriginGrade());
                }
            }
        } catch (Exception e) {
            throw new ServiceException("新建时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 更新组织信息
     *
     * @param origin
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer updateOrigin(Origin origin) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(origin.getOriginId())) {
                return originMapper.update(origin);
            }
        } catch (Exception e) {
            throw new ServiceException("更新信息时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 通过 originId 获取origin信息
     *
     * @param originId
     * @return
     * @throws ServiceException
     */
    @Override
    public Map<String, Object> getOriginById(Integer originId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(originId)) {
                return originMapper.getOriginById(originId);
            }
        } catch (Exception e) {
            throw new ServiceException("查询信息时发生异常");
        }
        return null;
    }

    /**
     * TODO 获取组织成员列表
     *
     * @param originId
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getOriginMembers(Page<Map<String, Object>> page, Integer originId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(originId)) {
                return originMapper.getOriginMember(page, originId);
            }
        } catch (Exception e) {
            throw new ServiceException("查询成员信息时发生异常！");
        }
        return null;
    }
}
