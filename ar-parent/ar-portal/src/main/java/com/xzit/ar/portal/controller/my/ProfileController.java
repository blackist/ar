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
import com.xzit.ar.common.po.user.UserJob;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.my.ProfileService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Date;

/**
 * @author Mr.Black
 * @ClassName: ProfileController
 * @Description: TODO
 * @date 2016年2月13日 上午12:32:02
 */
@Controller
@RequestMapping("/my/profile")
public class ProfileController extends BaseController {

    @Resource
    private ProfileService profileService;

    /**
     * TODO 加载用户基本信息
     *
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
     *
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

    /**
     * TODO 加载用户工作信息
     *
     * @param model
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/job")
    public String job(Model model) throws ServiceException {
        // 查询用户工作信息
        model.addAttribute("userJobs", profileService.getUserJobByUserId(getCurrentUserId()));

        return "my/profile/profile-job";
    }

    /**
     * TODO 添加用户工作信息
     * @param model
     * @param userJob
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/job/add")
    public String add(UserJob userJob) throws ServiceException {
        // 参数校验
        if (CommonUtil.isNotEmpty(userJob.getJobName()) && CommonUtil.isNotEmpty(userJob.getJobUnit())
                && CommonUtil.isNotEmpty(userJob.getJobDate())) {
            userJob.setJobDesc("");
            userJob.setUserId(getCurrentUserId());
            userJob.setCreateTime(new Date());
            userJob.setState("A");
            userJob.setStateTime(new Date());

            // 保存用户工作信息
            profileService.saveUserJob(userJob);
        }

        return "redirect:/my/profile/job.action";
    }

    /**
     * TODO 删除工作信息
     * @param jobId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/job/delete.action")
    public String delete(@RequestParam("jobId") Integer jobId) throws ServiceException {
        // 删除
        profileService.deleteUserJob(jobId);

        return "redirect:/my/profile/job.action";
    }

    @RequestMapping("/portrait")
    public String portrait(Model model) {
        return "my/profile/profile-portrait";
    }
}
