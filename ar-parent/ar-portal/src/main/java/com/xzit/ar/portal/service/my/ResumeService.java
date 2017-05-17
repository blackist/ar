/**  
 * @Title: ResumeService.java
 * @Package com.xzit.ar.portal.service.my
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月8日 下午11:23:24
 * @version V1.0  
 */
package com.xzit.ar.portal.service.my;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.recruit.ResumePost;
import com.xzit.ar.common.po.user.UserResume;

/**
 * @ClassName: ResumeService
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月8日 下午11:23:24
 */
public interface ResumeService {

	/**
	 * @Title: loadMyResumes
	 * @Description: TODO 进入个人中心是加载用户简历
	 * @param @param userId
	 * @param @return
	 * @param @throws ServiceException   
	 * @return List<Map<String, Object>>
	 * @throws
	 */
	List<Map<String, Object>> loadMyResumes(Integer userId) throws ServiceException;

	/**
	 * @Title: loadPostResumes
	 * @Description: TODO 投送简历时加载用户的所有简历
	 * @param @param userId
	 * @param @return
	 * @param @throws ServiceException   
	 * @return List<UserResume> 
	 * @throws
	 */
	List<Map<String, Object>> loadResumesToPost(Integer userId) throws ServiceException;
	
	/**
	 * @Title: postResume
	 * @Description: TODO 投递简历
	 * @param @param resumePost
	 */
	int postResume(ResumePost resumePost) throws ServiceException;
	
	/**
	 * @Title: cancelPostResume
	 * @Description: TODO 取消投递
	 */
	int cancelPostResume(Integer recruitId, Integer resumeId) throws ServiceException;
	
	/**
	 * @Title: postResumeRecord
	 * @Description: TODO 加载招聘信息简历投递记录
	 * @param @param recruitId
	 */
	List<Map<String, Object>> postResumeRecord(Integer recruitId) throws ServiceException;

	/**
	 * @param resume
	 * @return
	 * @throws ServiceException
	 */
	int createResume(UserResume resume) throws ServiceException;

	/**
	 * TODO 根据ID加载用户简历详情
	 * @param resumeId
	 * @return
	 * @throws ServiceException
	 */
	UserResume getResumeById(Integer resumeId) throws ServiceException;

	/**
	 * TODO 更新简历信息
	 * @param resume
	 * @return
	 * @throws ServiceException
	 */
	int updateResume(UserResume resume) throws ServiceException;

	/**
	 * TODO 删除个人简历
	 * @param resumeId
	 * @return
	 * @throws ServiceException
	 */
	int deleteResume(Integer resumeId) throws ServiceException;

	/**
	 * TODO 加载用户简历投递记录
	 * @return
	 * @throws ServiceException
	 */
	List<Map<String, Object>> getPostsByUserId(Page<Map<String, Object>> page, Integer userId) throws ServiceException;
}
