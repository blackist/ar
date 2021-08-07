package com.xzit.ar.portal.controller;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.constant.PathConstant;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.util.AsyncUtils;
import com.xzit.ar.common.util.IOUtil;
import com.xzit.ar.portal.service.classes.ClassService;
import com.xzit.ar.portal.service.forum.PostService;
import com.xzit.ar.portal.service.information.InformationService;
import com.xzit.ar.portal.service.recruit.RecruitService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Future;

/**
 * 校友录首页服务
 *
 * @author Mr.Black
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
     * 网站首页
     *
     * @param model ..
     * @return ..
     */
    @RequestMapping("/index")
    public String index(Model model) throws ServiceException {

        Map<String, Object> res = new ConcurrentHashMap<>(5);

        final CountDownLatch signal = new CountDownLatch(5);

        Future<?> inewFu = AsyncUtils.EXECUTORS.submit(() -> {
            try {
                // 校友新闻
                res.put("inews", informationService.getInfoByInfoType(new Page<>(getPageIndex(), 4), "AN"));
            } finally {
                signal.countDown();
            }
        });

        Future<?> newsFu = AsyncUtils.EXECUTORS.submit(() -> {
            try {
                // 校友新闻
                res.put("news", informationService.getInfoByInfoType(new Page<>(getPageIndex(), getPageSize()), "AN"));
            }finally {
                signal.countDown();
            }
        });

        Future<?> postsFu = AsyncUtils.EXECUTORS.submit(() -> {
            try {
                // 热门话题
                res.put("posts", postService.queryPosts(new Page<>(1, 10), ""));
            } finally {
                signal.countDown();
            }
        });

        Future<?> recruitFu = AsyncUtils.EXECUTORS.submit(() -> {
            try {
                // 热门招聘
                res.put("recruits", recruitService.queryRecruit(new Page<>(1, 8), ""));
            } finally {
                signal.countDown();
            }
        });

        Future<?> memberFu = AsyncUtils.EXECUTORS.submit(() -> {
            try {
                // 近期校友
                res.put("latestMembers", classService.latestMembers(5));
            } finally {
                signal.countDown();
            }
        });

        try {
            signal.await();

            res.forEach(model::addAttribute);
        } catch (Exception e) {
            logger.info("[Main] 加载首页信息异常", e);
        }

        return "portal-main/index";
    }

    /**
     * 下载文件
     *
     * @param response ..
     * @param fileRelPath ..
     * @param fileName ..
     * @return ..
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
        } catch (IOException e) {
            e.printStackTrace();
        }

        return null;
    }
}
