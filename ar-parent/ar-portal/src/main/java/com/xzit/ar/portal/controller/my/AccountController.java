package com.xzit.ar.portal.controller.my;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.po.user.User;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.my.AccountService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/4 14:12.
 */
@Controller
@RequestMapping("/my/account")
public class AccountController extends BaseController {

    @Resource
    private AccountService accountService;


    /**
     * TODO 账号信息
     *
     * @param model
     * @return
     */
    @RequestMapping("")
    public String account(Model model) throws ServiceException {
        // 加载用户账号信息
        model.addAttribute("user", accountService.getUserById(getCurrentUserId()));

        return "my/account/account-index";
    }

    /**
     * TODO 密码修改界面
     *
     * @return
     */
    @RequestMapping("/password")
    public String password() {
        return "my/account/account-password";
    }

    /**
     * TODO 密码修改提交
     *
     * @param originalPassword 原密码
     * @param newPassword      新密码
     * @param confirmPassword  确认密码
     * @return
     * @throws ServiceException
     * @throws UtilException
     */
    @RequestMapping("/password/update")
    public String password(String originalPassword, String newPassword, String confirmPassword) throws ServiceException, UtilException {
        // 查询原账号信息
        User user = accountService.getUserById(getCurrentUserId());
        // 验证原密码
        if (user != null && user.getPassword().equals(CommonUtil.md5(originalPassword))) {
            // 校验新密码
            if (newPassword.equals(confirmPassword)) {
                // 更新密码
                User newUser = new User();
                newUser.setUserId(getCurrentUserId());
                newUser.setPassword(CommonUtil.md5(newPassword));
                accountService.updateUser(newUser);
            }
        }

        return "redirect:/my/account.action";
    }

    /**
     * TODO 邮箱设置界面
     *
     * @return
     */
    @RequestMapping("/email")
    public String email() {
        return "my/account/account-email";
    }

    /**
     * TODO 更新用户email
     *
     * @param email
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/email/update")
    public String email(String email) throws ServiceException {
        if (CommonUtil.isNotEmpty(email)) {
            User user = new User();
            user.setUserId(getCurrentUserId());
            user.setEmail(email);

            accountService.updateUser(user);
        }

        return "redirect:/my/account.action";
    }

}
