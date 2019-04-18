package com.xzit.ar.common.mapper.user;

import com.xzit.ar.common.po.user.UserRole;

public interface UserRoleMapper {
    int insert(UserRole record);

    int insertSelective(UserRole record);
}