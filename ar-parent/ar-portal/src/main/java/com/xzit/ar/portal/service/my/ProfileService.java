package com.xzit.ar.portal.service.my;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.user.UserInfo;

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
}
