package com.xzit.ar.portal.service.my;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.user.User;
import com.xzit.ar.common.po.user.UserInfo;
import com.xzit.ar.common.po.user.UserJob;

import java.util.List;
import java.util.Map;

/**
 * 描述
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/15 22:42.
 */
public interface ProfileService {

    /**
     * 查询用户信息
     * @param userId
     * @return
     */
    UserInfo getUserInfo(Integer userId) throws ServiceException;

    /**
     * 更新用户信息
     * @param userInfo
     * @return
     */
    Integer updateUserInfo(UserInfo userInfo) throws ServiceException;

    /**
     * 加载用户工作信息列表
     * @param userId
     * @return
     */
    List<UserJob> getUserJobByUserId(Integer userId) throws ServiceException;

    /**
     * 保存工作信息
     * @param userJob
     * @return
     */
    Integer saveUserJob(UserJob userJob) throws ServiceException;

    /**
     * 删除工作信息
     * @param jobId
     * @return
     */
    Integer deleteUserJob(Integer jobId) throws ServiceException;

    /**
     * 更新用户头像信息
     * @param user
     * @return
     */
    Map<String, Object> updateUserPortrait(User user) throws ServiceException;
}
