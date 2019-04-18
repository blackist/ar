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

import com.xzit.ar.common.mapper.recruit.RecruitMapper;
import com.xzit.ar.common.page.Page;
import org.springframework.stereotype.Service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.recruit.ResumePostMapper;
import com.xzit.ar.common.mapper.user.UserResumeMapper;
import com.xzit.ar.common.po.recruit.ResumePost;
import com.xzit.ar.common.po.user.UserResume;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.my.ResumeService;

/**
 * @author Mr.Black
 * @ClassName: ResumeServiceImpl
 * @Description: TODO ResumeServiceImpl
 * @date 2016年2月8日 下午11:24:31
 */
@Service("resumeService")
public class ResumeServiceImpl implements ResumeService {

    @Resource
    private UserResumeMapper resumeMapper;

    @Resource
    private ResumePostMapper resumePostMapper;

    @Resource
    private RecruitMapper recruitMapper;

    @Override
    public List<Map<String, Object>> loadMyResumes(Integer userId) throws ServiceException {
        List<Map<String, Object>> resumeList = null;
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(userId)) {
                resumeList = resumeMapper.getResumes(userId);
            }
        } catch (Exception e) {
            throw new ServiceException("用户简历获取异常");
        }
        return resumeList;
    }

    @Override
    public List<Map<String, Object>> loadResumesToPost(Integer userId) throws ServiceException {
        List<Map<String, Object>> resumeList = null;
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(userId)) {
                resumeList = resumeMapper.getResumes(userId);
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
                    row = resumePostMapper.recoverResumeRecord(resumePost);
                    recruitMapper.addResumes(resumePost.getRecruitId());
                } else {
                    row = resumePostMapper.save(resumePost);
                    recruitMapper.addResumes(resumePost.getRecruitId());
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
        // 参数校验
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(recruitId)) {
                // 加载
                return resumePostMapper.postResumeRecord(recruitId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * TODO 删除个人简历
     *
     * @param resumeId
     * @return
     * @throws ServiceException
     */
    @Override
    public int deleteResume(Integer resumeId) throws ServiceException {
        int row = 0;
        try {
            if (CommonUtil.isNotEmpty(resumeId)) {
                row = resumeMapper.updateState(resumeId, "X");
            } else {
                throw new ServiceException("删除简历时发生异常！");
            }
        } catch (Exception e) {
            throw new ServiceException("删除简历时发生异常！");
        }
        return row;
    }

    /**
     * TODO 更新简历信息
     *
     * @param resume
     * @return
     * @throws ServiceException
     */
    @Override
    public int updateResume(UserResume resume) throws ServiceException {
        int row = 0;
        try {
            if (CommonUtil.isNotEmpty(resume.getResumeId())) {
                row = resumeMapper.update(resume);
            } else {
                throw new ServiceException("更新简历信息发生异常！");
            }
        } catch (Exception e) {
            throw new ServiceException("更新简历信息发生异常！");
        }
        return row;
    }

    /**
     * TODO 根据ID加载用户简历详情
     *
     * @param resumeId
     * @return
     * @throws ServiceException
     */
    @Override
    public UserResume getResumeById(Integer resumeId) throws ServiceException {
        try {
            return resumeMapper.getById(resumeId);
        } catch (Exception e) {
            throw new ServiceException("加载简历详情发生异常");
        }
    }

    @Override
    public int createResume(UserResume resume) throws ServiceException {
        int row = 0;
        try {
            row = resumeMapper.save(resume);
        } catch (Exception e) {
            throw new ServiceException("保存简历时发生异常！");
        }
        return row;
    }

    /**
     * TODO 取消简历投递
     * @param recruitId
     * @param resumeId
     * @return
     * @throws ServiceException
     */
    @Override
    public int cancelPostResume(Integer recruitId, Integer resumeId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(recruitId) && CommonUtil.isNotEmpty(resumeId)) {
                return resumePostMapper.deletePost(recruitId, resumeId);
            }
        } catch (Exception e) {
            throw new ServiceException("取消投递消息时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 加载用户简历投递记录
     *
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getPostsByUserId(Page<Map<String, Object>> page, Integer userId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(userId)) {
                return resumePostMapper.getPostByUserId(page, userId);
            }
        } catch (Exception e) {
            throw new ServiceException("查询简历投递信息时发生异常！");
        }
        return null;
    }
}
