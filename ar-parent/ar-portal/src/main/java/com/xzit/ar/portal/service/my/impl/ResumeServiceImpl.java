/**  
 * @Title: ResumeServiceImpl.java
 * @Package com.xzit.ar.portal.service.my.impl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月8日 下午11:24:31
 * @version V1.0  
 */
package com.xzit.ar.portal.service.my.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.recruit.ResumePostMapper;
import com.xzit.ar.common.mapper.user.UserResumeMapper;
import com.xzit.ar.common.po.recruit.ResumePost;
import com.xzit.ar.common.po.user.UserResume;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.my.ResumeService;

/**
 * @ClassName: ResumeServiceImpl
 * @Description: TODO ResumeServiceImpl
 * @author Mr.Black
 * @date 2016年2月8日 下午11:24:31
 */
@Service("resumeService")
public class ResumeServiceImpl implements ResumeService {

	@Resource
	private UserResumeMapper resumeMapper;

	@Resource
	private ResumePostMapper resumePostMapper;

	@Override
	public List<UserResume> loadMyResumes(Integer userId) throws ServiceException {
		return null;
	}

	@Override
	public List<Map<String, Object>> loadResumesToPost(Integer userId) throws ServiceException {
		List<Map<String, Object>> resumeList = null;
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(userId)) {
				resumeList = resumeMapper.loadPostResumes(userId);
			}
		} catch (Exception e) {
			throw new ServiceException("用户简历获取异常");
		}
		return resumeList;
	}

	@Override
	public int postResume(ResumePost resumePost) throws ServiceException {
		int row = 0;
		try {
			// 参数校验
			if (resumePost != null && CommonUtil.isNotEmpty(resumePost.getRecruitId())
					&& CommonUtil.isNotEmpty(resumePost.getResumeId())) {
				// 查询当前用户是否已经申请
				List<Map<String, Object>> result = resumePostMapper.checkResumeRecord(resumePost);
				if (CommonUtil.isNotEmpty(result) && result.size() > 0) {
					return resumePostMapper.recoverResumeRecord(resumePost);
				} else {
					row = resumePostMapper.save(resumePost);
				}
			} else {
				throw new ServiceException("简历投递异常");
			}
		} catch (Exception e) {
			throw new ServiceException("简历投递异常");
		}
		return row;
	}

	@Override
	public List<Map<String, Object>> postResumeRecord(Integer recruitId) throws ServiceException {
		List<Map<String, Object>> resumeRecords = null;
		// 参数校验
		if (CommonUtil.isNotEmpty(recruitId)) {
			resumeRecords = resumePostMapper.postResumeRecord(recruitId);
		}
		return resumeRecords;
	}

	@Override
	public int cancelPostResume(ResumePost resumePost) throws ServiceException {
		return 0;
	}

}
