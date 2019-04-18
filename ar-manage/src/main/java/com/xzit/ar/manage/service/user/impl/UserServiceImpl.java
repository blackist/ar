package com.xzit.ar.manage.service.user.impl;

import com.xzit.ar.common.mapper.user.UserMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.manage.service.user.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/19 20:43.
 */
@Service("userService")
public class UserServiceImpl implements UserService{

    @Resource
    private UserMapper userMapper;

    /**
     * TODO 查询用户列表
     *
     * @param page
     * @return
     */
    @Override
    public List<Map<String, Object>> queryUser(Page<Map<String, Object>> page) {
        userMapper.queryUser(page);
        return null;
    }
}
