/**
 * @Title: ProfileController.java
 * @Package com.xzit.ar.portal.controller.my
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月13日 上午12:32:02
 * @version V1.0
 */
package com.xzit.ar.portal.controller.my;

import com.xzit.ar.common.constant.PathConstant;
import com.xzit.ar.common.constant.WebConstant;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.po.image.Image;
import com.xzit.ar.common.po.user.User;
import com.xzit.ar.common.po.user.UserInfo;
import com.xzit.ar.common.po.user.UserJob;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.common.util.ImageUtil;
import com.xzit.ar.portal.service.image.ImageService;
import com.xzit.ar.portal.service.my.ProfileService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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

    @Resource
    private ImageService imageService;

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
    public String updateBasic(UserInfo userInfo, String birthdayString) throws ServiceException {
        // 日期校验
        if (CommonUtil.isNotEmpty(birthdayString)) {
            try {
                // 设置生日参数
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                Date birthday = simpleDateFormat.parse(birthdayString);
                userInfo.setBirthday(birthday);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        // 设置参数
        userInfo.setUserId(getCurrentUserId());
        userInfo.setState("A");
        userInfo.setStateTime(new Date());
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
     *
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
     *
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
    public String portrait() {
        return "my/profile/profile-portrait";
    }

    /**
     * TODO 上传用户头像
     *
     * @param session
     * @param portrait
     * @return
     * @throws UtilException
     * @throws ServiceException
     */
    @RequestMapping("/portrait/upload.action")
    public String upload(HttpSession session, MultipartFile portrait) throws UtilException, ServiceException {
        // 参数校验
        if (portrait != null && portrait.getSize() > 0) {
            Image image = new Image();
            image.setImageType("");
            image.setIsRemote("0");
            image.setState("A");
            image.setCreateTime(new Date());
            image.setStateTime(new Date());
            image.setImageName(portrait.getOriginalFilename());
            // 保存到硬盘
            String imagePath = ImageUtil.saveImage(portrait);
            image.setImagePath(imagePath);
            image.setThumbPath(imagePath);
            // 保存图片信息
            imageService.saveImage(image);

            // 更新头像信息
            if (CommonUtil.isNotEmpty(image.getImageId())) {
                User user = new User();
                user.setUserId(getCurrentUserId());
                user.setImageId(image.getImageId());
                // 更新并刷新session
                session.setAttribute(WebConstant.SESSION_USER, profileService.updateUserPortrait(user));
            }
        }

        return "redirect:/my/profile/portrait.action";
    }
}
