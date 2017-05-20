/**  
 * @Title: CmService.java
 * @Package com.xzit.ar.manage.service.origin
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年3月2日 下午11:55:47
 * @version V1.0  
 */
package com.xzit.ar.manage.service.classes;

import java.util.Map;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;

/**
 * @ClassName: CmService
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年3月2日 下午11:55:47
 */
public interface CmService {

	public Page<Map<String, Object>> queryClasses(Page<Map<String, Object>> page, String queryStr, String selectStr,
			String stateStr) throws ServiceException;

	public Integer updateClassState(Integer classId, String state) throws ServiceException;

	public Integer deleteClass(Integer classId) throws ServiceException;
}
