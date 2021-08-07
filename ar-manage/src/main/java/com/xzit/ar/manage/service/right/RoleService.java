/**  
 * @Title: RoleService.java
 * @Package com.xzit.uscdl.manage.service.right
 * @Description: TODO
 * @author 董亮亮
 * @date 2016年3月15日 下午7:14:56
 * @version V1.0  
 */
package com.xzit.ar.manage.service.right;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.role.Right;
import com.xzit.ar.common.po.role.Role;

import java.util.List;

/**
 * @ClassName: RoleService
 * @Description: TODO
 * @author 董亮亮
 * @date 2016年3月15日 下午7:14:56
 */
public interface RoleService {

	/**
	 * @Title: queryRole
	 * @Description: 查询角色
	 */
	Page<Role> queryRole(Page<Role> page) throws ServiceException;

	/**
	 * @Title: getRoleById
	 * @Description: 获取角色
	 */
	Role getRoleById(Integer roleId) throws ServiceException;

	/**
	 * @Title: getRightsByRole
	 * @Description: 记载角色的权限
	 */
	List<Right> getRightsByRole(Integer roleId) throws ServiceException;

	/**
	 * @Title: getRoleIdByRoleValue
	 * @Description: 通过rolevalue获取roleId
	 */
	Integer getRoleIdByRoleValue(String roleValue) throws ServiceException;

	/**
	 * @Title: updateRoleRights
	 * @Description: 更新对角色的权限分配
	 */
	Integer updateRoleRights(Integer roleId, List<Integer> idList) throws ServiceException;

	/**
	 * @Title: getRoleValueByAdminId
	 * @Description: 通过adminId获取管理员身份
	 */
	String getRoleValueByAdminId(Integer adminId) throws ServiceException;

	/**
	 * @Title: getAllRoles
	 * @Description: 加载所有角色
	 */
	List<Right> getAllRoles() throws ServiceException;
}
