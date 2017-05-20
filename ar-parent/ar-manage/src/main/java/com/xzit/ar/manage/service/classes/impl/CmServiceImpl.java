/**  
 * @Title: CmServiceImpl.java
 * @Package com.xzit.ar.manage.service.origin.impl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年3月2日 下午11:56:22
 * @version V1.0  
 */
package com.xzit.ar.manage.service.classes.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.origin.GradeMapper;
import com.xzit.ar.common.mapper.origin.OriginMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.classes.CmService;

/**
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年3月2日 下午11:56:22
 */
@Service("cmService")
public class CmServiceImpl implements CmService {

	@Resource
	private GradeMapper gradeMapper;

	@Resource
	private OriginMapper classMapper;

	@Override
	@Cacheable(value = "classCache")
	public Page<Map<String, Object>> queryClasses(Page<Map<String, Object>> page, String queryStr, String selectStr,
			String stateStr) throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isEmpty(queryStr)) {
				queryStr = "";
			}
			if (CommonUtil.isEmpty(selectStr)) {
				selectStr = "";
			}
			if (CommonUtil.isEmpty(stateStr)) {
				stateStr = "";
			}
			queryStr = "%" + queryStr + "%";
			selectStr = "%" + selectStr + "%";
			stateStr = "%" + stateStr + "%";
			// 查询
			classMapper.queryClasses(page, queryStr, selectStr, stateStr);
			return page;
		} catch (Exception e) {
			throw new ServiceException("班级录异常");
		}
	}

	@Override
	@CacheEvict(value = "classCache", beforeInvocation = true, allEntries = true)
	public Integer updateClassState(Integer classId, String state) throws ServiceException {
		try {
			return classMapper.updateState(classId, state);
		} catch (Exception e) {
			throw new ServiceException("冻结班级时发生错误");
		}
	}

	@Override
	@CacheEvict(value = "classCache", beforeInvocation = true, allEntries = true)
	public Integer deleteClass(Integer classId) throws ServiceException {
		try {
			return classMapper.delete(classId);
		} catch (Exception e) {
			throw new ServiceException("彻底删除班级时发生异常");
		}
	}

}
