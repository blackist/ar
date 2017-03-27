package com.xzit.ar.common.mapper.user;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;

public interface UserMapper extends BaseMapper {

	Map<String, Object> selectByAccount(@Param("account") String account);

	Map<String, Object> loadUserRelInfo(@Param("userId") Integer userId);
}