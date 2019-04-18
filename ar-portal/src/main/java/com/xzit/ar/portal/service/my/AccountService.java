package com.xzit.ar.portal.service.my;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.user.User;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/16 14:22.
 */
public interface AccountService {

    /**
     * TODO 查询用户账号信息
     * @param userId
     * @return
     * @throws ServiceException
     */
    User getUserById(Integer userId) throws ServiceException;

    /**
     * TODO 更新用户账号信息
     * @param user
     * @return
     * @throws ServiceException
     */
    Integer updateUser(User user) throws ServiceException;
}
