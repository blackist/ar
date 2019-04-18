/**  
 * @Title: JobService.java
 * @Package com.xzit.ar.manage.service.job
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月9日 下午4:50:49
 * @version V1.0  
 */
package com.xzit.ar.manage.service.job;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.recruit.Recruit;

/**
 * @ClassName: JobService
 * @Description: TODO JobService
 * @author Mr.Black
 * @date 2016年2月9日 下午4:50:49
 */
public interface JobService {

	/**
	 * @Title: createJob
	 * @Description: TODO 保存招聘信息
	 */
	public int createJob(Recruit recruit) throws ServiceException;

	/**
	 * @Title: queryJobs
	 * @Description: TODO 条件查新
	 */
	public List<Map<String, Object>> queryJobs(Page<Map<String, Object>> page, String queryStr, String state)
			throws ServiceException;

	/**
	 * @Title: getDetailJob
	 * @Description: TODO 招聘详情
	 */
	public Map<String, Object> getDetailJob(Integer id) throws ServiceException;

	/**
	 * @Title: loadOtherRecruits
	 * @Description: TODO 加载招聘信息发布单位的其他招聘信息
	 */
	public List<Map<String, Object>> loadOtherRecruits(Integer unitId, Integer recruitId) throws ServiceException;

	/**
	 * @Title: setTopJob
	 * @Description: TODO 置顶
	 */
	public int setTopJob(Integer recruitId) throws ServiceException;

	/**
	 * @Title: cancelTopJob
	 * @Description: TODO 取消置顶
	 */
	public int cancelTopJob(Integer recruitId) throws ServiceException;

	/**
	 * @Title: auditJob
	 * @Description: TODO 审核招聘信息
	 */
	public int auditJob(Integer recruitId) throws ServiceException;

	/**
	 * @Title: auditJobs
	 * @Description: TODO 批量审核招聘信息
	 */
	public int auditJobs(List<Integer> recruitIds) throws ServiceException;

	/**
	 * @Title: removeJob
	 * @Description: TODO 删除招聘信息
	 */
	public int removeJob(Integer recruitId) throws ServiceException;

	/**
	 * @Title: removeJobs
	 * @Description: TODO 批量删除
	 */
	public int removeJobs(List<Integer> recruitIds) throws ServiceException;

	/**
	 * @Title: deleteJob
	 * @Description: TODO 彻底删除
	 */
	public int deleteJob(Integer recruitId) throws ServiceException;

	public int deleteJobs(List<Integer> recruitIds) throws ServiceException;

	/**
	 * @Title: recoverJob
	 * @Description: TODO 恢复数据到未审核状态
	 */
	public int recoverJob(Integer recruitId) throws ServiceException;

	public int recoverJobs(List<Integer> recruitIds) throws ServiceException;
}
