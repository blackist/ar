package com.xzit.ar.common.mapper.user;

import com.xzit.ar.common.po.user.UserJob;

public interface UserJobMapper {
    int deleteByPrimaryKey(Integer jobId);

    int insert(UserJob record);

    int insertSelective(UserJob record);

    UserJob selectByPrimaryKey(Integer jobId);

    int updateByPrimaryKeySelective(UserJob record);

    int updateByPrimaryKey(UserJob record);
}