/**
 * @Title: ManageController.java
 * @Package com.xzit.ar.portal.controller
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月14日 下午2:05:32
 * @version V1.0
 */
package com.xzit.ar.portal.controller;

import com.xzit.ar.common.constant.PathConstant;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.common.util.IOUtil;
import com.xzit.ar.portal.service.classes.ClassService;
import com.xzit.ar.portal.service.forum.PostService;
import com.xzit.ar.portal.service.information.InformationService;
import com.xzit.ar.portal.service.recruit.RecruitService;
import org.aspectj.util.FileUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Map;

/**
 * @author Mr.Black
 * @ClassName: ManageController
 * @Description: TODO MainController
 * @date 2016年1月14日 下午2:05:32
 */
@Controller
@RequestMapping("")
public class MainController extends BaseController {

    @Resource
    private ClassService classService;

    @Resource
    private PostService postService;

    @Resource
    private RecruitService recruitService;

    @Resource
    private InformationService informationService;

    /**
     * TODO 网站首页
     *
     * @param model
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/index")
    public String index(Model model) throws ServiceException {

        // 校友新闻
        model.addAttribute("inews",
                informationService.getInfoByInfoType(new Page<Map<String, Object>>(getPageIndex(), 4), "AN"));
        // 校友新闻
        model.addAttribute("news",
                informationService.getInfoByInfoType(new Page<Map<String, Object>>(getPageIndex(), getPageSize()), "AN"));
        // 热门话题
        model.addAttribute("posts",
                postService.queryPosts(new Page<Map<String, Object>>(1, 10), ""));
        // 热门招聘
        model.addAttribute("recruits",
                recruitService.queryRecruit(new Page<Map<String, Object>>(1, 8), ""));
        // 近期校友
        model.addAttribute("latestMembers", classService.latestMembers(5));

        return "portal-main/index";
    }

    /**
     * TODO 下载文件
     *
     * @param response
     * @param fileRelPath
     * @param fileName
     * @return
     * @throws UtilException
     */
    @RequestMapping("/download")
    public String download(HttpServletResponse response, String fileRelPath, String fileName) throws UtilException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("multipart/form-data");
        response.setHeader("Content-Disposition",
                "attachment;fileName=" + IOUtil.createFileName(fileName));

        // 读取文件
        try {
            File file = new File(PathConstant.contextAbsolutePath + fileRelPath);
            InputStream inputStream = new FileInputStream(file);
            OutputStream os = response.getOutputStream();
            byte[] b = new byte[1024];
            int length;
            while ((length = inputStream.read(b)) > 0) {
                os.write(b, 0, length);
            }
            inputStream.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
