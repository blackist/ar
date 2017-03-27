/**  
 * @Title: RecruitService.java
 * @Package com.xzit.ar.portal.service.recruit
 * @Description: TODO
 * @author QinChong
 * @date 2016年1月24日 下午1:34:02
 * @version V1.0  
 */
package com.xzit.ar.portal.service.recruit;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.recruit.Recruit;

/**
 * @ClassName: RecruitService
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月24日 下午1:34:02
 */
public interface RecruitService {

	public int createRecruit(Recruit recruit) throws ServiceException;
	
	public List<Map<String, Object>> queryRecruit(Page<Map<String, Object>> page, String queryStr) throws ServiceException ;
	
	public Map<String, Object> getDetailRecruit(Integer id) throws ServiceException ;

	public List<Map<String, Object>> loadOtherRecruits(Integer unitId,Integer recruitId) throws ServiceException;
}
