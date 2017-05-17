package com.xzit.ar.portal.service.my;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.user.User;
import com.xzit.ar.common.po.user.UserInfo;
import com.xzit.ar.common.po.user.UserJob;

import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/15 22:42.
 */
public interface ProfileService {

    /**
     * TODO 查询用户信息
     * @param userId
     * @return
     * @throws ServiceException
     */
    UserInfo getUserInfo(Integer userId) throws ServiceException;

    /**
     * TODO 更新用户信息
     * @param userInfo
     * @return
     * @throws ServiceException
     */
    Integer updateUserInfo(UserInfo userInfo) throws ServiceException;

    /**
     * TODO 加载用户工作信息列表
     * @param userId
     * @return
     * @throws ServiceException
     */
    List<UserJob> getUserJobByUserId(Integer userId) throws ServiceException;

    /**
     * TODO 保存工作信息
     * @param userJob
     * @return
     * @throws ServiceException
     */
    Integer saveUserJob(UserJob userJob) throws ServiceException;

    /**
     * TODO 删除工作信息
     * @param jobId
     * @return
     * @throws ServiceException
     */
    Integer deleteUserJob(Integer jobId) throws ServiceException;

    /**
     * TODO 更新用户头像信息
     * @param user
     * @return
     * @throws ServiceException
     */
    Map<String, Object> updateUserPortrait(User user) throws ServiceException;
}
