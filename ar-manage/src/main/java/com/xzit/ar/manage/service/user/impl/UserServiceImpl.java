package com.xzit.ar.manage.service.user.impl;

import com.xzit.ar.common.mapper.user.UserInfoMapper;
import com.xzit.ar.common.mapper.user.UserMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.user.User;
import com.xzit.ar.common.po.user.UserInfo;
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

    @Resource
    private UserInfoMapper userInfoMapper;

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

    @Override
    public User addUser(User user) {
        try {
            int a = userMapper.save(user);
            Map<String, Object> _user = userMapper.selectByAccount(user.getAccount());
            UserInfo userInfo = new UserInfo();
            userInfo.setUserId(Integer.parseInt(_user.get("userId").toString()));
            userInfo.setState("A");
            userInfoMapper.save(userInfo);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public Map<String, Object> getUserByAccount(String account) {
        try {
            return userMapper.selectByAccount(account);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
