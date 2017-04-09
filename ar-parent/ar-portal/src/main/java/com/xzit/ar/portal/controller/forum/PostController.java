package com.xzit.ar.portal.controller.forum;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.portal.service.forum.PostService;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

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
        // 
        model.addAttribute("post", postService.getPostById(postId));

        return "forum/post/post-detail";
    }
}
