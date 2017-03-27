package com.xzit.ar.common.mapper.user;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;

public interface UserOriginMapper extends BaseMapper {

	List<Integer> getAllOriginMemberIds(@Param("originId") Integer originId);

	Integer isMemberInOrigin(@Param("originId") Integer originId, @Param("userId") Integer userId);
}