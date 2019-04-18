package com.xzit.ar.common.mapper.role;

import com.xzit.ar.common.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

public interface RoleRightMapper extends BaseMapper {

	Integer deleteRoleRights(@Param("roleId") Integer roleId);
}