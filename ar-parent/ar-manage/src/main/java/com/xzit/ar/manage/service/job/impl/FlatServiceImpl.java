/**  
 * @Title: FlatServiceImpl.java
 * @Package com.xzit.ar.manage.service.job.impl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月10日 下午3:36:42
 * @version V1.0  
 */
package com.xzit.ar.manage.service.job.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.recruit.RecruitUnitMapper;
import com.xzit.ar.common.po.recruit.RecruitUnit;
import com.xzit.ar.manage.service.job.FlatService;

/**
 * @ClassName: FlatServiceImpl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月10日 下午3:36:42
 */
@Service("flatService")
public class FlatServiceImpl implements FlatService {

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
			throw new ServiceException("查询招聘单位信息时发生异常！");
		}

		return unitList;
	}

	@Override
	public Integer createUnit(RecruitUnit recruitUnit) throws ServiceException {
		Integer unitId;
		try {
			unitId = unitMapper.save(recruitUnit);
		} catch (Exception e) {
			throw new ServiceException("职业招聘模块异常");
		}
		return unitId;
	}

}
