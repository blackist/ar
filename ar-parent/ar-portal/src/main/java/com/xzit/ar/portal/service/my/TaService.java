package com.xzit.ar.portal.service.my;

import com.xzit.ar.common.exception.ServiceException;

import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/23 22:34.
 */
public interface TaService {

    /**
     * TODO 获取用户的基本信息：userId, account, potrait, trueName, introduce
     * @param userId
     * @return
     * @throws ServiceException
     */
    Map<String, Object> getUserBasicInfo(Integer userId) throws ServiceException;
}
