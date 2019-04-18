/**  
 * @Title: FlatService.java
 * @Package com.xzit.ar.manage.service.job
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月10日 下午3:35:18
 * @version V1.0  
 */
package com.xzit.ar.manage.service.job;

import java.util.List;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.recruit.RecruitUnit;

/**
 * @ClassName: FlatService
 * @Description: TODO 处理职业招聘的单位的业务信息
 * @author Mr.Black
 * @date 2016年2月10日 下午3:35:18
 */
public interface FlatService {

	/**
	 * @Title: createUnit
	 * @Description: TODO createUnit
	 * @param @param recruitUnit
	 */
	public Integer createUnit(RecruitUnit recruitUnit) throws ServiceException;

	/**
	 * @Title: getUnitsByUserId
	 * @Description: TODO 查询当前用户的招聘信息单位
	 * @param @param userId
	 */
	public List<RecruitUnit> getUnitsByUserId(Integer userId) throws ServiceException;
}
