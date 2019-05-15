package com.xzit.ar.manage.controller.user;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.user.User;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.user.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Date;
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

    @RequestMapping("/add")
    public String userAddPage(Model model) {
        model.addAttribute("sex", false);
        return "user/user-add";
    }

    @RequestMapping(value = "/add/submit", method = RequestMethod.POST)
    public String userAddSubmit(Model model,
                                @RequestParam("account") String account,
                                @RequestParam("trueName") String trueName,
                                @RequestParam("isAdmin") String isAdmin,
                                @RequestParam("email") String email,
                                @RequestParam("introduce") String introduce) throws UtilException {
        if (CommonUtil.isNotEmpty(account)) {
            Map<String, Object> _user = userService.getUserByAccount(account);
            if (_user != null) {
                setMessage(account + " 已存在");
                System.out.println(account + " 已存在");
                return "redirect:/user.action";
            } else {
                User user = new User();
                user.setAccount(account);
                user.setTrueName(trueName);
                user.setEmail(email);
                user.setIsAdmin(isAdmin);
                user.setIntroduce(introduce);
                user.setState("A");
                user.setPassword(CommonUtil.md5("12345678"));
                user.setImageId(1);
                user.setStateTime(new Date());
                user.setCreateTime(new Date());
                userService.addUser(user);
            }
        }

        return "redirect:/user.action";
    }
}
