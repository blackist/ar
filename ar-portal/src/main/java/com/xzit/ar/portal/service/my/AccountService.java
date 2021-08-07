package com.xzit.ar.portal.service.my;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.user.User;

/**
 * 描述
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/16 14:22.
 */
public interface AccountService {

    /**
     * 查询用户账号信息
     * @param userId
     * @return
     */
    User getUserById(Integer userId) throws ServiceException;

    /**
     * 更新用户账号信息
     * @param user
     * @return
     */
    Integer updateUser(User user) throws ServiceException;
}
