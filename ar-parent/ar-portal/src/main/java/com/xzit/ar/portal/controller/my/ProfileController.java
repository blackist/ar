/**
 * @Title: ProfileController.java
 * @Package com.xzit.ar.portal.controller.my
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月13日 上午12:32:02
 * @version V1.0
 */
package com.xzit.ar.portal.controller.my;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.user.UserInfo;
import com.xzit.ar.portal.service.my.ProfileService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;

import javax.annotation.Resource;

/**
 * @ClassName: ProfileController
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月13日 上午12:32:02
 */
@Controller
@RequestMapping("/my/profile")
public class ProfileController extends BaseController {

    @Resource
    private ProfileService profileService;

    /**
     * TODO 加载用户基本信息
     * @param model
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/basic")
    public String basic(Model model) throws ServiceException {
        // 查询用户资料
        model.addAttribute("userInfo", profileService.getUserInfo(getCurrentUserId()));

        return "my/profile/profile-basic";
    }

    /**
     * TODO 更新用户信息
     * @param userInfo
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/basic/update")
    public String updateBasic(UserInfo userInfo) throws ServiceException {
        System.out.println(userInfo.getWechat());
        // 设置用户id
        userInfo.setUserId(getCurrentUserId());
        profileService.updateUserInfo(userInfo);

        return "redirect:/my/profile/basic.action";
    }

    @RequestMapping("/job")
    public String job(Model model) {
        return "my/profile/profile-job";
    }

    @RequestMapping("/portrait")
    public String portrait(Model model) {
        return "my/profile/profile-portrait";
    }
}
