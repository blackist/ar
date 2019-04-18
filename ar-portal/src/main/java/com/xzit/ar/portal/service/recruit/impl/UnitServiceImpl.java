/**
 * @Title: UnitServiceImpl.java
 * @Package com.xzit.ar.portal.service.recruit.impl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月3日 下午4:51:01
 * @version V1.0
 */
package com.xzit.ar.portal.service.recruit.impl;

import java.util.List;

import javax.annotation.Resource;

import com.xzit.ar.common.util.CommonUtil;
import org.springframework.stereotype.Service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.recruit.RecruitUnitMapper;
import com.xzit.ar.common.po.recruit.RecruitUnit;
import com.xzit.ar.portal.service.recruit.UnitService;

/**
 * @ClassName: UnitServiceImpl
 * @Description: TODO UnitService实现类
 * @author Mr.Black
 * @date 2016年2月3日 下午4:51:01
 */
@Service("unitService")
public class UnitServiceImpl implements UnitService {

    @Resource
    private RecruitUnitMapper unitMapper;

    @Override
    public List<RecruitUnit> getUnitsByUserId(Integer userId) throws ServiceException {
        List<RecruitUnit> unitList = null;
        // 校验参数
        if (userId == null || userId == 0) {
            throw new ServiceException("系统异常");
        }
        // 获取unitList
        try {
            unitList = unitMapper.getUnitsByUserId(userId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return unitList;
    }

    @Override
    public Integer createUnit(RecruitUnit recruitUnit) throws ServiceException {
        Integer unitId = null;
        try {
            unitId = unitMapper.save(recruitUnit);
        } catch (Exception e) {
            throw new ServiceException("职业招聘模块异常");
        }
        return unitId;
    }

    @Override
    public RecruitUnit getUnitByUserId(Integer userId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(userId)) {
                List<RecruitUnit> units = unitMapper.getUnitsByUserId(userId);
                if (CommonUtil.isNotEmpty(units)) {
                    return units.get(0);
                }
            }
        } catch (Exception e) {
            throw new ServiceException("查询招聘单位信息时发生异常！");
        }
        return null;
    }

    @Override
    public Integer updateUnit(RecruitUnit recruitUnit) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(recruitUnit.getUnitId())) {
                return unitMapper.update(recruitUnit);
            }
        } catch (Exception e) {
            throw new ServiceException("更新单位信息时发生异常！");
        }
        return null;
    }
}
