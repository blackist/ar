/**  
 * @Title: UnitService.java
 * @Package com.xzit.ar.portal.service.recruit
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月3日 下午4:48:59
 * @version V1.0  
 */
package com.xzit.ar.portal.service.recruit;

import java.util.List;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.recruit.RecruitUnit;

/**
 * @ClassName: UnitService
 * @Description: TODO UnitService
 * @author Mr.Black
 * @date 2016年2月3日 下午4:48:59
 */
public interface UnitService {
	
	Integer createUnit(RecruitUnit recruitUnit) throws ServiceException;

	List<RecruitUnit> getUnitsByUserId(Integer userId) throws ServiceException;

	RecruitUnit getUnitByUserId(Integer userId) throws ServiceException;

	Integer updateUnit(RecruitUnit recruitUnit) throws ServiceException;
}
