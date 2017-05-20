/**
 * @Title: ControllerReflect.java <br>
 * @Package com.xzit.ar.manage.controller <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2016年1月3日 上午10:25:46 <br>
 * @version V1.0 <br>
 */
package com.xzit.ar.manage.controller.right;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.role.Right;
import com.xzit.ar.common.util.privilege.PrivilegeUtil;
import com.xzit.ar.manage.service.right.RightService;

/**
 * @ClassName: ControllerReflect <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2016年1月3日 上午10:25:46 <br>
 * @version V1.0 <br>
 */
@Controller
@RequestMapping("/right")
public class RightController extends BaseController {

    @Resource
    private RightService rightService;

    /**
     * @Description: TODO 加载权限管理索引界面<br>
     * @author Mr.Black <br>
     * @date 2016年1月4日 上午11:39:33 <br>
     */
    @RequestMapping("/indexRight")
    public String indexRight() {
        return "authority/right/right-index";
    }

    @RequestMapping("/queryRights")
    public String queryRights(Model model, String queryInput) throws ServiceException {
        Page<Right> page = new Page<Right>();
        page.setPageIndex(getPageIndex());
        page.setPageSize(getPageSize());
        rightService.queryRights(page, queryInput);

        model.addAttribute("page", page);
        model.addAttribute("queryInput", queryInput);

        return "authority/right/right-query";
    }

    /**
     * @Title: addRight
     * @Description: TODO addRight
     */
    @RequestMapping("/addRight")
    public String addRight() {

        return null;
    }

    @RequestMapping("/updateRight")
    public String updateRight(Model model, @RequestParam("rightId") Integer rightId) throws ServiceException {
        Right right = rightService.selectById(rightId);
        model.addAttribute("right", right);
        setMessage(model, "只能改变权限名、是否公开");

        return "authority/right/right-update";
    }

    @RequestMapping("/updateRightSubmit")
    public String updateRightSubmit(Model model, Right right) throws ServiceException {
        int row = 0;
        if (right != null) {
            // 更新操作
            row = rightService.updateRight(right);
        }
        // 结果判断
        if (row < 1) {
            setMessage(model, "修改失败！");
        } else {
            setMessage(model, "修改成功！");
        }

        return "forward:queryRights.action";
    }

    /**
     * @Title: scanAddRights
     * @Description: TODO 扫描并添加未被添加的权限
     */
    @RequestMapping("/scanAddRights")
    public String scanAddRights(Model model) throws ServiceException {
        int newRights = 0;
        // 索引当前所有权限url
        List<String> rightUrlList = PrivilegeUtil.detectAllRightURL();
        for (String rightUrl : rightUrlList) {
            // 判断是否存在
            if (rightService.selectByRightUrl(rightUrl) == null) {
                // 生成默认格式right
                Right right = PrivilegeUtil.makeDefaultRight(rightUrl);
                // 持久化right
                if (rightService.saveRight(right) > 0) {
                    newRights++;
                }
            }
        }
        if (newRights > 0) {
            setMessage(model, "新增权限" + newRights + "条权限");
        } else {
            setMessage(model, "没有新增权限");
        }
        return "forward:queryRights.action";
    }
}
