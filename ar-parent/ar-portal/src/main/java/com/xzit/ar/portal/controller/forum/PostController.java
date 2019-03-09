package com.xzit.ar.portal.controller.forum;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Comment;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.forum.PostService;
import com.xzit.ar.portal.service.information.CommentService;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.Date;
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

    @Resource
    private CommentService commentService;

    /**
     * TODO 加载信息详情
     *
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

    @RequestMapping("/outline")
    public String outline(Model model, Integer userId) throws ServiceException {
        // 数据返回
        model.addAttribute("posts",
                postService.getUserPost(new Page<Map<String, Object>>(1, 20), userId));

        return "forum/post/post-outline";
    }

    /**
     * TODO 加载评论列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/commentList")
    public String commentList(Model model, @Param("postId") Integer postId) throws ServiceException {
        // 构造 page 对象
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        // 加载列表
        postService.dynamicLoadComment(page, postId);
        model.addAttribute("page", page);

        return "forum/post/post-comments";
    }

    /**
     * TODO 评论帖子
     *
     * @param model
     * @param redirectAttributes
     * @param comment
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/comment")
    public String comment(Model model, RedirectAttributes redirectAttributes, Comment comment) throws ServiceException {
        // 设置参数
        comment.setUserId(getCurrentUserId());
        comment.setCreateTime(new Date());
        // 存储
        postService.commentPost(comment);
        // 重定向
        if (comment != null && CommonUtil.isNotEmpty(comment.getInfoId())) {
            redirectAttributes.addAttribute("postId", comment.getInfoId());
            return "redirect:/post/detail.action";
        } else {
            return "redirect:/forum.action";
        }
    }

    /**
     * TODO 为帖子点赞
     *
     * @param model
     * @param postId
     * @return
     * @throws ServiceException
     */
    @RequestMapping(value = "/love", method = RequestMethod.GET)
    @ResponseBody
    public String love(Model model, @Param("postId") Integer postId) throws ServiceException {
        return postService.lovePost(postId).toString();
    }

    /**
     * TODO 加载发帖界面
     *
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String add(Model model) {
        model.addAttribute("themes", ARContext.infoTheme);
        return "forum/post/post-add";
    }

    /**
     * TODO 保存用户发布的新帖
     *
     * @param model
     * @param information
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/save")
    public String save(Model model, Information information) throws ServiceException {
        // 设置参数
        information.setCreateTime(new Date());
        information.setStateTime(new Date());
        information.setState("A");
        information.setInfoType("BBS");
        information.setIsTop("0");
        information.setComments(0);
        information.setUserId(getCurrentUserId());
        information.setLoves(0);
        information.setViews(0);

        postService.savePost(information);

        return "redirect:/forum.action";
    }

    /**
     * TODO 删除帖子
     *
     * @param postId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/delete")
    public String delete(@Param("postId") Integer postId) throws ServiceException {
        postService.deletePost(postId, getCurrentUserId());
        return "redirect:/forum.action";
    }

    /**
     * TODO 删除用户评论
     *
     * @param commentId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/deleteComment")
    public @ResponseBody
    Integer deleteComment(@Param("commentId") Integer commentId) throws ServiceException {
        return commentService.deleteComment(commentId, getCurrentUserId());
    }
}
