/**
 * @Title: RoleServiceImpl.java
 * @Package com.xzit.uscdl.manage.service.right.impl
 * @Description: TODO
 * @author 董亮亮
 * @date 2016年3月15日 下午7:15:16
 * @version V1.0
 */
package com.xzit.ar.manage.service.right.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.role.RoleMapper;
import com.xzit.ar.common.mapper.role.RoleRightMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.role.Right;
import com.xzit.ar.common.po.role.Role;
import com.xzit.ar.common.po.role.RoleRight;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.right.RoleService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * @author 董亮亮
 * @ClassName: RoleServiceImpl
 * @Description: TODO
 * @date 2016年3月15日 下午7:15:16
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private RoleRightMapper roleRightMapper;

    @Override
    public Page<Role> queryRole(Page<Role> page) throws ServiceException {
        try {
            roleMapper.queryRole(page);
            return page;
        } catch (Exception e) {
            throw new ServiceException("加载角色时发生错误");
        }
    }

    @Override
    public Role getRoleById(Integer roleId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(roleId)) {
                return roleMapper.getById(roleId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载角色时发生错误");
        }
        return null;
    }

    @Override
    public List<Right> getRightsByRole(Integer roleId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(roleId)) {
                return roleMapper.getRightsByRole(roleId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载权限时发生错误");
        }
        return null;
    }

    @Override
    public Integer updateRoleRights(Integer roleId, List<Integer> idList) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(roleId)) {
                // 删除已有权限
                roleRightMapper.deleteRoleRights(roleId);
                // 新增权限
                if (CommonUtil.isNotEmpty(idList)) {
                    for (Integer rightId : idList) {
                        RoleRight roleRight = new RoleRight();
                        roleRight.setRightId(rightId);
                        roleRight.setRoleId(roleId);
                        roleRightMapper.save(roleRight);
                    }
                }
                return 1;
            }
        } catch (Exception e) {
            throw new ServiceException("分配权限时发生错误");
        }
        return 0;
    }

    @Override
    public Integer getRoleIdByRoleValue(String roleValue) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(roleValue)) {
                return roleMapper.getRoleId(roleValue);
            }
        } catch (Exception e) {
            throw new ServiceException("查询数据时发生错误");
        }
        return null;
    }

    @Override
    public String getRoleValueByAdminId(Integer adminId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(adminId)) {
                Map<String, Object> role = roleMapper.getRoleValueByAdminId(adminId);
                if (CommonUtil.isNotEmpty(role)) {
                    return role.get("roleValue").toString();
                }
            }
        } catch (Exception e) {
            throw new ServiceException("查询数据时发生错误");
        }
        return null;
    }

    @Override
    public List<Right> getAllRoles() throws ServiceException {
        try {
            return roleMapper.getAll();
        } catch (Exception e) {
            throw new ServiceException("查询系统角色时发生错误");
        }
    }

}
