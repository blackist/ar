package com.xzit.ar.manage.controller.user;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/19 17:16.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Resource
    private UserService userService;

    /**
     * TODO 加载用户管理界面
     * @return
     */
    @RequestMapping("")
    public String index() {

        return "user/user-index";
    }

    /**
     * TODO 查询用户列表
     * @param model
     * @param query
     * @param state
     * @return
     */
    @RequestMapping("/queryUser")
    public String queryUser(Model model, String query, String state, String isAdmin) {
        // 分页类
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        Map<String, Object> user = new HashMap<>();
        // 参数校验
        if (CommonUtil.isNotEmpty(query)) {
            user.put("query", "%" + query + "%");
        }
        if (CommonUtil.isNotEmpty(state)) {
            user.put("state", state);
        }
        if (CommonUtil.isNotEmpty(isAdmin)) {
            user.put("isAdmin", isAdmin);
        }
        page.setQueryMap(user);
        // 查询用户
        userService.queryUser(page);
        // 数据返回
        model.addAttribute("page", page);
        model.addAttribute("query", query);
        model.addAttribute("state", state);
        model.addAttribute("isAdmin", isAdmin);

        return "user/user-query";
    }
}
