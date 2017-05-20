/**  
 * @Title: ClassService.java
 * @Package com.xzit.ar.portal.service.origin
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

	/**
	 * TODO 获取年级列表，年级列表中含有各年级班级数
	 * @return
	 * @throws ServiceException
	 */
	List<Grade> getAll() throws ServiceException;

	/**
	 * TODO 条件查询班级
	 * @param page 分页类
	 * @param queryStr 查询条件
	 * @param selectStr   查询条件
	 * @return
	 * @throws ServiceException
	 */
	List<Map<String, Object>> queryClasses(Page<Map<String, Object>> page, String queryStr, String selectStr)
			throws ServiceException;

	/**
	 * TODO 查询班级总数
	 * @return
	 * @throws ServiceException
	 */
	Integer countClassNum() throws ServiceException;

	/**
	 * TODO 查询加入班记录的总人数
	 * @return
	 * @throws ServiceException
	 */
	Integer countClassMembers() throws ServiceException;

	/**
	 * TODO 加载我加入的班级
	 * @param userId
	 * @return
	 * @throws ServiceException
	 */
	List<Map<String, Object>> loadMyClass(Integer userId) throws ServiceException;

	/**
	 * TODO 加载热门班级
	 * @param number
	 * @return
	 * @throws ServiceException
	 */
	List<Map<String, Object>> loadPopularClass(Integer number) throws ServiceException;

	/**
	 * TODO 查询最近加入的用户
	 * @param number
	 * @return
	 * @throws ServiceException
	 */
	List<Map<String, Object>> latestMembers(Integer number) throws ServiceException;

	/**
	 * TODO 条件查询组织
	 * @param page
	 * @return
	 * @throws ServiceException
	 */
	List<Map<String, Object>> queryOrigin(Page<Map<String, Object>> page) throws ServiceException;
}
