/**  
* @Title: RightService.java <br>
* @Package com.xzit.ar.manage.service.right <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午10:50:00 <br>
* @version V1.0 <br>
*/ 
package com.xzit.ar.manage.service.right;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.role.Right;

/**
* @ClassName: RightService <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午10:50:00 <br>
* @version V1.0  <br>
*/
public interface RightService {

	List<Map<String, Object>> queryRights(Page<Right> page, String queryInput) throws ServiceException;
	
	Right selectById(Integer rightId) throws ServiceException ;
	
	int saveRight(Right right) throws ServiceException;
	
	Right selectByRightUrl(String rightUrl) throws ServiceException;
	
	int updateRight(Right right) throws ServiceException;

	List<Right> getIsNotPublicRights() throws ServiceException;
}
