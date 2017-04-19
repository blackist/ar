package com.xzit.ar.common.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;

public interface UserOriginMapper extends BaseMapper {

	/**
	 * TODO 获取该组织所有成员id列表
	 * @param originId
	 * @return
	 * @throws Exception
	 */
	List<Integer> getAllOriginMemberIds(@Param("originId") Integer originId) throws Exception;

	/**
	 * TODO 判断用户是否是该组织的成员
	 * @param originId
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	Integer isMemberInOrigin(@Param("originId") Integer originId, @Param("userId") Integer userId) throws Exception;
}