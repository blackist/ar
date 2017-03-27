/**  
 * @Title: ClassService.java
 * @Package com.xzit.ar.portal.service.classes
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月18日 下午1:01:20
 * @version V1.0  
 */
package com.xzit.ar.portal.service.classes;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.origin.Grade;

/**
 * @ClassName: ClassService
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月18日 下午1:01:20
 */
public interface ClassService {

	public List<Grade> getAll() throws ServiceException;

	public List<Map<String, Object>> queryClasses(Page<Map<String, Object>> page, String queryStr, String selectStr)
			throws ServiceException;

	public Integer countClassNum() throws ServiceException;

	public Integer countClassMembers() throws ServiceException;

	public List<Map<String, Object>> loadMyClass(Integer userId) throws ServiceException;
	
	public List<Map<String, Object>> loadPopularClass(Integer number) throws ServiceException;
	
	public List<Map<String, Object>> latestMembers(Integer number) throws ServiceException;
}
