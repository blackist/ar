package com.xzit.ar.portal.controller.forum;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.portal.service.forum.PostService;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;

/**
 * TODO ${TODO}
 * Created by 董亮亮 on 2017/4/9.
 */
@Controller
@RequestMapping("/post")
public class PostController extends BaseController {

    @Resource
    private PostService postService;

    /**
     * TODO 加载信息详情
     * @param model
     * @param postId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/detail")
    public String detail(Model model, @Param("postId") Integer postId) throws ServiceException {
        // 加载帖子详情
        model.addAttribute("post", postService.getPostById(postId));

        return "forum/post/post-detail";
    }

    /**
     * TODO 加载评论列表
     * @param model
     * @return
     */
    @RequestMapping("/commentList")
    public String commentList(Model model, @Param("postId") Integer postId) throws ServiceException {
        System.out.println("Comments");
        // 构造 page 对象
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        // 加载列表
        postService.dynamicLoadComment(page, postId);
        model.addAttribute("page", page);

        return "forum/post/post-comments";
    }
}
