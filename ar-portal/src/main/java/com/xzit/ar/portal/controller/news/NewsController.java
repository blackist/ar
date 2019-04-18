package com.xzit.ar.portal.controller.news;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Comment;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.forum.PostService;
import com.xzit.ar.portal.service.information.InformationService;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/3 21:29.
 */
@Controller
@RequestMapping("/news")
public class NewsController extends BaseController {

    @Resource
    private InformationService informationService;

    @Resource
    private PostService postService;

    /**
     * TODO 加载新闻中心界面
     * @param model
     * @return
     */
    @RequestMapping("")
    public String index(Model model) throws ServiceException {

        // 校友新闻
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        informationService.getInfoByInfoType(page, "AN");
        model.addAttribute("page", page);

        return "news/news-index";
    }

    /**
     * TODO 加载热门新闻
     * @param model
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/outline")
    public String outline(Model model) throws ServiceException {
        //
        model.addAttribute("hotNews",
                informationService.getHotInfoByInfoType(new Page<Map<String, Object>>(1, 5), "AN"));

        return "news/news-outline";
    }

    /**
     * TODO 加载新闻详情
     * @param model
     * @return
     */
    @RequestMapping("/detail")
    public String detail(Model model, Integer infoId) throws ServiceException {
        //
        model.addAttribute("info", informationService.getInfoById(infoId));

        return "news/news-detail";
    }

    /**
     * TODO 加载评论列表
     * @param model
     * @return
     */
    @RequestMapping("/commentList")
    public String commentList(Model model, @Param("infoId") Integer infoId) throws ServiceException {
        // 构造 page 对象
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        // 加载列表
        postService.dynamicLoadComment(page, infoId);
        model.addAttribute("page", page);

        return "news/news-comments";
    }

    /**
     * TODO 评论新闻
     * @param redirectAttributes
     * @param comment
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/comment")
    public String comment(RedirectAttributes redirectAttributes, Comment comment) throws ServiceException {
        // 设置参数
        comment.setUserId(getCurrentUserId());
        comment.setCreateTime(new Date());
        // 存储
        postService.commentPost(comment);
        // 重定向
        if (comment != null && CommonUtil.isNotEmpty(comment.getInfoId())){
            redirectAttributes.addAttribute("infoId", comment.getInfoId());
            return "redirect:/news/detail.action";
        } else {
            return "redirect:/news.action";
        }
    }
    
}
