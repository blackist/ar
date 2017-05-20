/**
 * @Title: RoleController.java
 * @Package com.xzit.uscdl.manage.controller.right
 * @Description: TODO
 * @author 董亮亮
 * @date 2016年3月15日 下午7:05:25
 * @version V1.0
 */
package com.xzit.ar.manage.controller.right;

import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.role.Right;
import com.xzit.ar.common.po.role.Role;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.right.RightService;
import com.xzit.ar.manage.service.right.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 董亮亮
 * @ClassName: RoleController
 * @Description: TODO
 * @date 2016年3月15日 下午7:05:25
 */
@Controller
@RequestMapping("/role")
public class RoleController extends BaseController {

    @Resource
    private RoleService roleService;

    @Resource
    private RightService rightService;

    @RequestMapping("")
    public String index() {
        return "authority/role/role-index";
    }

    @RequestMapping("/queryRole")
    public String queryRole(Model model) throws ServiceException {
        Page<Role> page = new Page<>(getPageIndex(), getPageSize());
        // 传递数据
        model.addAttribute("page", roleService.queryRole(page));

        return "authority/role/role-query";
    }

    @RequestMapping("/edit")
    public String edit(Model model) {
        return "";
    }

    @RequestMapping("/editSubmit")
    public String editSubmit() {
        return "";
    }

    @RequestMapping("/add")
    public String add() {
        return "";
    }

    @RequestMapping("/addSubmit")
    public String addSubmit() {
        return "";
    }

    @RequestMapping("/allot")
    public String allot(Model model, Integer roleId) throws ServiceException {
        // 传递数据
        model.addAttribute("role", roleService.getRoleById(roleId));
        // 所有权限
        model.addAttribute("rightList", rightService.getIsNotPublicRights());
        // 角色已分配的权限
        List<Right> roleRights = roleService.getRightsByRole(roleId);
        List<Integer> rightIds = new ArrayList<>();
        for (Right right : roleRights) {
            rightIds.add(right.getRightId());
        }
        model.addAttribute("roleRights", roleRights);
        model.addAttribute("rightIds", rightIds);

        return "authority/role/role-allot";
    }

    @RequestMapping("/allotSubmit")
    public String allotSubmit(Model model, String rightIds, Integer roleId) throws ServiceException {
        List<Integer> idList = CommonUtil.splitIds(rightIds);
        if (roleService.updateRoleRights(roleId, idList) > 0) {
            setMessage(model, "更新成功");
        } else {
            setMessage(model, "更新失败");
        }
        return "forward:queryRole.action";
    }
}
