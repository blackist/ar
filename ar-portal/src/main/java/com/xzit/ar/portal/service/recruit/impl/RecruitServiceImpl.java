/**
 * @Title: RecruitServiceImpl.java
 * @Package com.xzit.ar.portal.service.recruit.impl
 * @Description: TODO
 * @author 钁ｄ寒浜?-Dosgi.requiredJavaVersion=1.7
 * @date 2016年1月24日 下午1:39:09
 * @version V1.0
 */
package com.xzit.ar.portal.service.recruit.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.recruit.RecruitMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.recruit.Recruit;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.recruit.RecruitService;

/**
 * @author Mr.Black
 * @ClassName: RecruitServiceImpl
 * @Description: TODO RecruitService实现类
 * @date 2016年1月24日 下午1:39:09
 */
@Service("recruitService")
public class RecruitServiceImpl implements RecruitService {

    @Resource
    private RecruitMapper recruitMapper;

    @Override
    public List<Map<String, Object>> queryRecruit(Page<Map<String, Object>> page, String queryStr)
            throws ServiceException {
        List<Map<String, Object>> recruitList = null;
        // 参数校验
        if (!CommonUtil.isNotEmpty(queryStr)) {
            queryStr = "";
        }
        queryStr = "%" + queryStr + "%";
        try {
            recruitList = recruitMapper.queryRecruit(page, queryStr);
        } catch (Exception e) {
            throw new ServiceException("加载招聘信息失败");
        }
        return recruitList;
    }

    @Override
    public Map<String, Object> getDetailRecruit(Integer id) throws ServiceException {
        Map<String, Object> recruit = null;
        try {
            recruit = recruitMapper.getDetailRecruit(id);
        } catch (Exception e) {
            throw new ServiceException("加载招聘详情错误");
        }
        return recruit;
    }

    @Override
    public int createRecruit(Recruit recruit) throws ServiceException {
        try {
            recruitMapper.save(recruit);
        } catch (Exception e) {
            throw new ServiceException("发布招聘失败!");
        }
        return 0;
    }

    @Override
    public List<Map<String, Object>> loadOtherRecruits(Integer unitId, Integer recruitId) throws ServiceException {
        List<Map<String, Object>> otherRecruits = null;
        try {
            otherRecruits = recruitMapper.loadOtherRecruits(unitId, recruitId);
        } catch (Exception e) {
            throw new ServiceException("未能正确加载相关招聘信息");
        }
        return otherRecruits;
    }

    /**
     * TODO 查询用户发布的招聘信息
     *
     * @param page
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getRecruitByUserId(Page<Map<String, Object>> page, Integer userId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(userId)) {
                return recruitMapper.getRecruitByUserId(page, userId);
            }
        } catch (Exception e) {
            throw new ServiceException("查询招聘信息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 删除招聘信息
     *
     * @param recruitId
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer deleteRecruit(Integer recruitId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(recruitId)) {
                return recruitMapper.delete(recruitId);
            }
        } catch (Exception e) {
            throw new ServiceException("删除招聘信息时发生异常！");
        }
        return 0;
    }
}
