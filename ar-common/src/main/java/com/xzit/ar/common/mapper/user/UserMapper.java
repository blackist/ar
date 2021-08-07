package com.xzit.ar.common.mapper.user;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.page.Page;
import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;

public interface UserMapper extends BaseMapper {

	/**
	 * 通过账号查询用户
	 * @param account 账号
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> selectByAccount(@Param("account") String account) throws  Exception;

	/**
	 * 获取用户基本信息：userId, account, portrait, trueName, introduce
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	Map<String, Object> getUserBasicInfo(@Param("userId") Integer userId) throws Exception;

	/**
	 * 查询用户列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> queryUser(Page<Map<String, Object>> page);

}