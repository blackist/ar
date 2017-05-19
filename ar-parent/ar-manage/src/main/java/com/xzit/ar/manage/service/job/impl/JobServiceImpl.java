/**
 * @Title: JobServiceImpl.java
 * @Package com.xzit.ar.manage.service.job.impl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月9日 下午4:51:31
 * @version V1.0
 */
package com.xzit.ar.manage.service.job.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.recruit.RecruitMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.recruit.Recruit;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.job.JobService;

/**
 * @ClassName: JobServiceImpl
 * @Description: TODO JobServiceImpl
 * @author Mr.Black
 * @date 2016年2月9日 下午4:51:31
 */
@Service("jobService")
public class JobServiceImpl implements JobService {

    @Resource
    private RecruitMapper recruitMapper;

    @Override
    public List<Map<String, Object>> queryJobs(Page<Map<String, Object>> page, String queryStr, String state)
            throws ServiceException {
        List<Map<String, Object>> recruitList = null;
        // 参数校验
        if (!CommonUtil.isNotEmpty(queryStr)) {
            queryStr = "";
        }
        if (state == null) {
            state = "A";
        }
        queryStr = "%" + queryStr + "%";
        state = "%" + state + "%";
        try {
            recruitList = recruitMapper.queryJob(page, queryStr, state);
        } catch (Exception e) {
            throw new ServiceException("加载招聘信息失败");
        }
        return recruitList;
    }

    @Override
    public Map<String, Object> getDetailJob(Integer id) throws ServiceException {
        Map<String, Object> recruit = null;
        try {
            recruit = recruitMapper.getDetailRecruit(id);
        } catch (Exception e) {
            throw new ServiceException("加载招聘详情错误");
        }
        return recruit;
    }

    @Override
    public int createJob(Recruit recruit) throws ServiceException {
        int row = 0;
        try {
            row = recruitMapper.save(recruit);
        } catch (Exception e) {
            throw new ServiceException("发布招聘失败!");
        }
        return row;
    }

    @Override
    public List<Map<String, Object>> loadOtherRecruits(Integer unitId, Integer recruitId) throws ServiceException {
        List<Map<String, Object>> otherRecruits = null;
        try {
            otherRecruits = recruitMapper.loadOtherRecruits(unitId, recruitId);
        } catch (Exception e) {
            throw new ServiceException("未能正确加载相关招聘信息");
        }
        return otherRecruits;
    }

    @Override
    public int setTopJob(Integer recruitId) throws ServiceException {
        int row = 0;
        if (CommonUtil.isNotEmpty(recruitId)) {
            try {
                Recruit recruit = new Recruit();
                recruit.setRecruitId(recruitId);
                recruit.setIsTop("1");
                recruit.setStateTime(new Date());
                row = recruitMapper.update(recruit);
            } catch (Exception e) {
                throw new ServiceException("置顶操作异常");
            }
        }
        return row;
    }

    @Override
    public int cancelTopJob(Integer recruitId) throws ServiceException {
        int row = 0;
        if (CommonUtil.isNotEmpty(recruitId)) {
            try {
                Recruit recruit = new Recruit();
                recruit.setRecruitId(recruitId);
                recruit.setIsTop("0");
                recruit.setStateTime(new Date());
                row = recruitMapper.update(recruit);
            } catch (Exception e) {
                throw new ServiceException("置顶操作异常");
            }
        }
        return row;
    }

    @Override
    public int removeJob(Integer recruitId) throws ServiceException {
        int row = 0;
        if (CommonUtil.isNotEmpty(recruitId)) {
            try {
                Recruit recruit = new Recruit();
                recruit.setRecruitId(recruitId);
                recruit.setState("X");
                recruit.setIsTop("0");
                row = recruitMapper.update(recruit);
            } catch (Exception e) {
                throw new ServiceException("删除操作异常");
            }
        }
        return row;
    }

    @Override
    public int removeJobs(List<Integer> recruitIds) throws ServiceException {
        int row = 0;
        if (CommonUtil.isNotEmpty(recruitIds)) {
            try {
                row = recruitMapper.batchState(recruitIds, "X");
            } catch (Exception e) {
                throw new ServiceException("删除操作异常");
            }
        }
        return row;
    }

    @Override
    public int deleteJob(Integer recruitId) throws ServiceException {
        int row = 0;
        if (CommonUtil.isNotEmpty(recruitId)) {
            try {
                row = (int) recruitMapper.delete(recruitId);
            } catch (Exception e) {
                throw new ServiceException("删除操作异常");
            }
        }
        return row;
    }

    @Override
    public int auditJob(Integer recruitId) throws ServiceException {
        int row = 0;
        if (CommonUtil.isNotEmpty(recruitId)) {
            try {
                Recruit recruit = new Recruit();
                recruit.setRecruitId(recruitId);
                recruit.setState("A");
                row = recruitMapper.update(recruit);
            } catch (Exception e) {
                throw new ServiceException("审核操作异常");
            }
        }
        return row;
    }

    @Override
    public int auditJobs(List<Integer> recruitIds) throws ServiceException {
        int row = 0;
        if (CommonUtil.isNotEmpty(recruitIds)) {
            try {
                row = recruitMapper.batchState(recruitIds, "A");
            } catch (Exception e) {
                throw new ServiceException("批量审核操作异常");
            }
        }
        return row;
    }

    @Override
    public int deleteJobs(List<Integer> recruitIds) throws ServiceException {
        int row = 0;
        if (CommonUtil.isNotEmpty(recruitIds)) {
            try {
                row = recruitMapper.deleteEntities(recruitIds);
            } catch (Exception e) {
                throw new ServiceException("删除操作异常");
            }
        }
        return row;
    }

    @Override
    public int recoverJob(Integer recruitId) throws ServiceException {
        int row = 0;
        if (CommonUtil.isNotEmpty(recruitId)) {
            try {
                row = recruitMapper.updateState(recruitId, "D");
            } catch (Exception e) {
                throw new ServiceException("恢复操作异常");
            }
        }
        return row;
    }

    @Override
    public int recoverJobs(List<Integer> recruitIds) throws ServiceException {
        int row = 0;
        if (CommonUtil.isNotEmpty(recruitIds)) {
            try {
                row = recruitMapper.batchState(recruitIds, "D");
            } catch (Exception e) {
                throw new ServiceException("恢复操作异常");
            }
        }
        return row;
    }

}
