package com.xzit.ar.common.mapper.user;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;

public interface UserMapper extends BaseMapper {

	/**
	 * TODO 通过账号查询用户
	 * @param account 账号
	 * @return
	 * @throws Exception
	 */
	public Map<String, Object> selectByAccount(@Param("account") String account) throws  Exception;

}