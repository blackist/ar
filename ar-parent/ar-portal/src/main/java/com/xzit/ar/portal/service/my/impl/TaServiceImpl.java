package com.xzit.ar.portal.service.my.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.user.UserMapper;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.my.TaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/23 22:34.
 */
@Service("taService")
public class TaServiceImpl implements TaService {

    @Resource
    private UserMapper userMapper;

    /**
     * TODO 获取用户的基本信息：userId, account, potrait, trueName, introduce
     *
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public Map<String, Object> getUserBasicInfo(Integer userId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(userId)){
                return userMapper.getUserBasicInfo(userId);
            }
        } catch (Exception e) {
            throw new ServiceException("查询用户信息异常！");
        }
        return null;
    }
}
