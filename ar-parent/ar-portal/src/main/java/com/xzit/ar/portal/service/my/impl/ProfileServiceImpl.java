package com.xzit.ar.portal.service.my.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.user.UserInfoMapper;
import com.xzit.ar.common.mapper.user.UserJobMapper;
import com.xzit.ar.common.po.user.UserInfo;
import com.xzit.ar.common.po.user.UserJob;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.my.ProfileService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/15 22:45.
 */
@Service("profileService")
public class ProfileServiceImpl implements ProfileService {

    @Resource
    private UserInfoMapper userInfoMapper;

    @Resource
    private UserJobMapper jobMapper;

    /**
     * TODO 查询用户信息
     *
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public UserInfo getUserInfo(Integer userId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(userId)) {
                return userInfoMapper.getUserInfoByUserId(userId);
            }
        } catch (Exception e) {
            throw new ServiceException("查询用户信息时发生异常！");
        }

        return null;
    }

    /**
     * TODO 更新用户信息
     *
     * @param userInfo
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer updateUserInfo(UserInfo userInfo) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(userInfo.getUserId())) {
                // 查询用户信息，若存在则更新，否则，保存用户信息
                UserInfo temp = userInfoMapper.getUserInfoByUserId(userInfo.getUserId());
                if (temp != null && CommonUtil.isNotEmpty(temp.getUserInfoId())) {
                    // 设置用户信息id
                    userInfo.setUserInfoId(temp.getUserInfoId());
                    userInfoMapper.update(userInfo);
                } else {
                    // 用户第一次编辑个人信息，保存信息
                    userInfoMapper.save(userInfo);
                }

            }
        } catch (Exception e) {
            throw new ServiceException("更新用户信息时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 加载用户工作信息列表
     *
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public List<UserJob> getUserJobByUserId(Integer userId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(userId)) {
                return jobMapper.getUserJobByUserId(userId);
            }
        } catch (Exception e) {
            throw new ServiceException("查询用户工作信息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 保存工作信息
     *
     * @param userJob
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer saveUserJob(UserJob userJob) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(userJob.getUserId())) {
                jobMapper.save(userJob);
            }
        } catch (Exception e) {
            throw new ServiceException("保存用户工作信息时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 删除工作信息
     *
     * @param jobId
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer deleteUserJob(Integer jobId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(jobId)) {
                return jobMapper.delete(jobId);
            }
        } catch (Exception e) {
            throw new ServiceException("删除用户工作信息时发生异常！");
        }
        return 0;
    }
}
