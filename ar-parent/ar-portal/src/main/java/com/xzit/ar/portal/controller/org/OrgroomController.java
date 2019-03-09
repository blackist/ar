package com.xzit.ar.portal.controller.org;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.album.Album;
import com.xzit.ar.common.po.info.Comment;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.po.origin.Origin;
import com.xzit.ar.common.po.user.UserOrigin;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.image.AlbumService;
import com.xzit.ar.portal.service.information.CommentService;
import com.xzit.ar.portal.service.information.InformationService;
import com.xzit.ar.portal.service.my.TaService;
import com.xzit.ar.portal.service.org.OrgroomService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * TODO 校友组织主页
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/16 15:34.
 */
@Controller
@RequestMapping("/orgroom")
public class OrgroomController extends BaseController {

    @Resource
    private OrgroomService orgroomService;

    @Resource
    private InformationService informationService;

    @Resource
    private CommentService commentService;

    @Resource
    private TaService taService;

    @Resource
    private AlbumService albumService;


    /**
     * TODO 加载校友组织首页
     *
     * @param model
     * @param originId
     * @return
     */
    @RequestMapping("")
    public String index(Model model, @RequestParam("originId") Integer originId) throws ServiceException {

        // 校友组织基本信息
        Origin origin = orgroomService.getOriginById(originId);
        if (origin == null || CommonUtil.isEmpty(origin.getOriginId())) {
            return "redirect:/org.action";
        }
        model.addAttribute("orgroom", origin);
        // 查询组织内最新消息
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), 3);
        model.addAttribute("latestInfos", informationService.getOriginInfos(page, originId, "OI"));
        // 加载组织成员id 列表
        model.addAttribute("memberIds", orgroomService.getMemberIds(originId));

        return "org/orgroom/orgroom-index";
    }

    /**
     * TODO 加入组织
     *
     * @param attributes
     * @param originId   组织id
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/joinOrigin")
    public String joinOrigin(RedirectAttributes attributes, @RequestParam("originId") Integer originId) throws ServiceException {
        // 加入组织
        if (CommonUtil.isNotEmpty(originId)) {
            // 设置参数
            UserOrigin userOrigin = new UserOrigin();
            userOrigin.setOriginId(originId);
            userOrigin.setUserId(getCurrentUserId());
            userOrigin.setCreateTime(new Date());
            userOrigin.setState("A");
            userOrigin.setStateTime(new Date());
            // 存储
            orgroomService.joinOrigin(userOrigin);
        }
        // 传递参数
        attributes.addAttribute("originId", originId);

        return "redirect:/orgroom.action";
    }

    /**
     * TODO 加载校友组织动态消息页面
     *
     * @param model    视图model
     * @param originId 组织id
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/info")
    public String info(Model model, @RequestParam("originId") Integer originId) throws ServiceException {
        // 校友组织基本信息
        Origin origin = orgroomService.getOriginById(originId);
        if (origin == null || CommonUtil.isEmpty(origin.getOriginId())) {
            return "redirect:/org.action";
        }
        model.addAttribute("orgroom", origin);
        // 分页查询组织内最新消息
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        informationService.getOriginInfos(page, originId, "OI");
        model.addAttribute("page", page);

        return "org/orgroom/orgroom-info";
    }

    /**
     * TODO 发布组织动态消息
     *
     * @param attributes
     * @param content
     * @param originId
     * @return
     * @throws ServiceException
     * @author 董亮亮
     */
    @RequestMapping("/publishInfo")
    public String publishInfo(RedirectAttributes attributes, @RequestParam("infoTitle") String infoTitle, @RequestParam("content") String content, @RequestParam("originId") Integer originId) throws ServiceException {
        System.out.println(infoTitle);
        if (CommonUtil.isNotEmpty(infoTitle) && CommonUtil.isNotEmpty(content) && CommonUtil.isNotEmpty(originId)) {
            Information information = new Information();
            // 设置消息内容
            information.setInfoTitle(infoTitle);
            information.setContent(content);
            information.setCreateTime(new Date());
            information.setUserId(getCurrentUserId());
            information.setOriginId(originId);
            information.setComments(0);
            information.setViews(0);
            information.setLoves(0);
            information.setIsTop("0");
            information.setInfoType("OI");
            information.setState("A");
            information.setStateTime(new Date());
            information.setTheme("");
            information.setThumbImage("");
            // 存储数据库
            informationService.publishOriginInfo(information);
            setMessage(attributes, "发布成功！");

        }
        // 重定向
        attributes.addAttribute("originId", originId);

        return "redirect:/orgroom/info.action";
    }


    /**
     * TODO 加载班级动态详情
     *
     * @param model
     * @param originId
     * @return
     */
    @RequestMapping("/infoDetail")
    public String infoDetail(Model model, Integer originId, Integer infoId) throws ServiceException {
        // 校友组织基本信息
        Origin origin = orgroomService.getOriginById(originId);
        // 加载消息详情
        Map<String, Object> info = informationService.getInfoByInfoIdAndOriginId(infoId, originId);
        // 校验
        if (origin == null || CommonUtil.isEmpty(origin.getOriginId()) || info == null) {
            return "redirect:/org.action";
        }
        model.addAttribute("orgroom", origin);
        model.addAttribute("info", info);

        return "org/orgroom/orgroom-info-detail";
    }

    /**
     * TODO 动态加载评论
     *
     * @param model
     * @param infoId
     * @return
     */
    @RequestMapping("/infoCommentList")
    public String infoCommentList(Model model, @RequestParam("infoId") Integer infoId) throws ServiceException {
        // 构造 page 对象
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        // 加载列表
        commentService.dynamicLoadComment(page, infoId);
        model.addAttribute("page", page);

        return "org/orgroom/orgroom-info-comments";
    }

    /**
     * TODO 评论帖子
     *
     * @param redirectAttributes
     * @param comment
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/commentInfo")
    public String commentInfo(RedirectAttributes redirectAttributes, Comment comment, Integer originId) throws ServiceException {
        // 设置参数
        comment.setUserId(getCurrentUserId());
        comment.setCreateTime(new Date());
        // 存储
        commentService.saveComment(comment);
        // 重定向
        if (comment != null && CommonUtil.isNotEmpty(comment.getInfoId()) && CommonUtil.isNotEmpty(originId)) {
            redirectAttributes.addAttribute("infoId", comment.getInfoId());
            redirectAttributes.addAttribute("originId", originId);
            return "redirect:/orgroom/infoDetail.action";
        }
        return "redirect:/org.action";
    }

    /**
     * TODO 为消息点赞
     *
     * @param infoId
     * @return
     */
    @RequestMapping("/loveInfo")
    @ResponseBody
    public String loveInfo(@RequestParam("infoId") Integer infoId) throws ServiceException {
        return informationService.loveInfo(infoId).toString();
    }

    /**
     * TODO 删除消息
     *
     * @param redirectAttributes
     * @param infoId
     * @return
     */
    @RequestMapping("/deleteInfo")
    public String deleteInfo(RedirectAttributes redirectAttributes, @RequestParam("infoId") Integer infoId, @RequestParam("originId") Integer originId) throws ServiceException {
        // 删除评论 
        informationService.deleteInfo(infoId, getCurrentUserId());
        // 重定向
        redirectAttributes.addAttribute("originId", originId);
        return "redirect:/orgroom/info.action";
    }

    /**
     * TODO 加载消息详情页面的侧边栏
     *
     * @param model
     * @param authorId
     * @param originId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/infoSide")
    public String infoSide(Model model, @RequestParam("authorId") Integer authorId, @RequestParam("originId") Integer originId) throws ServiceException {
        // 校友组织基本信息
        Origin origin = orgroomService.getOriginById(originId);
        if (origin == null || CommonUtil.isEmpty(origin.getOriginId())) {
            return "redirect:/org.action";
        }
        model.addAttribute("orgroom", origin);
        // 查询组织内最新消息
        Page<Map<String, Object>> page1 = new Page<>(1, 4);
        model.addAttribute("originOtherInfos", informationService.getOriginInfos(page1, originId, "OI"));
        // 用户基本信息
        model.addAttribute("author", taService.getUserBasicInfo(authorId));
        // 查询用户最近消息
        Page<Map<String, Object>> page2 = new Page<>(1, 4);
        model.addAttribute("authorOtherInfos", informationService.getOriginUserInfos(page2, authorId, originId, "OI"));

        return "org/orgroom/orgroom-info-side";
    }

    /**
     * TODO 加载组织留言板
     *
     * @param model
     * @param originId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/message")
    public String message(Model model, Integer originId) throws ServiceException {
        // 校友组织基本信息
        Origin origin = orgroomService.getOriginById(originId);
        if (origin == null || CommonUtil.isEmpty(origin.getOriginId())) {
            return "redirect:/org.action";
        }
        model.addAttribute("orgroom", origin);
        // 加载留言
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        informationService.getOriginInfos(page, originId, "OM");
        model.addAttribute("page", page);

        return "org/orgroom/orgroom-message";
    }

    /**
     * TODO 发表组织留言
     *
     * @param attributes
     * @param information
     * @return
     * @throws ServiceException
     */
    @RequestMapping("publishMessage")
    public String publishMessage(RedirectAttributes attributes, Information information) throws ServiceException {
        System.out.println(information.getContent());
        // 参数校验
        if (CommonUtil.isNotEmpty(information.getOriginId()) && CommonUtil.isNotEmpty(information.getContent())) {
            // 设置消息内容
            information.setInfoTitle("");
            information.setCreateTime(new Date());
            information.setUserId(getCurrentUserId());
            information.setComments(0);
            information.setViews(0);
            information.setLoves(0);
            information.setIsTop("0");
            information.setInfoType("OM");
            information.setState("A");
            information.setStateTime(new Date());
            information.setTheme("");
            information.setThumbImage("");

            // 保存数据
            informationService.publishOriginInfo(information);
        }
        // 加入重定向参数
        attributes.addAttribute("originId", information.getOriginId());

        return "redirect:/orgroom/message.action";
    }

    /**
     * TODO 加载组织的成员列表
     *
     * @param model
     * @param originId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/member")
    public String member(Model model, @RequestParam("originId") Integer originId) throws ServiceException {
        // 校友组织基本信息
        Origin origin = orgroomService.getOriginById(originId);
        if (origin == null || CommonUtil.isEmpty(origin.getOriginId())) {
            return "redirect:/org.action";
        }
        model.addAttribute("orgroom", origin);
        // 成员信息
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), 20);
        orgroomService.getOriginMember(page, originId);
        // 传递成员列表 
        model.addAttribute("page", page);

        return "org/orgroom/orgroom-member";
    }

    /**
     * TODO 加载组织通讯录
     *
     * @param model
     * @param originId originId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/directory")
    public String directory(Model model, Integer originId) throws ServiceException {
        // 校友组织基本信息
        Origin origin = orgroomService.getOriginById(originId);
        if (origin == null || CommonUtil.isEmpty(origin.getOriginId())) {
            return "redirect:/org.action";
        }
        model.addAttribute("orgroom", origin);
        // 成员信息
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), 20);
        orgroomService.getOriginDirectory(page, originId);
        // 传递通讯录数据
        model.addAttribute("page", page);
        model.addAttribute("letters", ARContext.lowerLetters);

        return "org/orgroom/orgroom-directory";
    }

    /**
     * TODO 加载组织相册
     *
     * @param model
     * @param originId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/album")
    public String album(Model model, @RequestParam("originId") Integer originId) throws ServiceException {
        // 校友组织基本信息
        Origin origin = orgroomService.getOriginById(originId);
        if (origin == null || CommonUtil.isEmpty(origin.getOriginId())) {
            return "redirect:/org.action";
        }
        model.addAttribute("orgroom", origin);
        // 加载相册
        Page<Album> page = new Page<>(getPageIndex(), 12);
        albumService.getAlbums(page, originId);
        // 传递数据
        model.addAttribute("page", page);

        return "org/orgroom/orgroom-album";
    }

    /**
     * TODO 加载相册照片流
     *
     * @param model
     * @param albumId
     * @param originId
     * @return
     */
    @RequestMapping("/album/image")
    public String image(Model model, Integer albumId, Integer originId) throws ServiceException {
        // 校友组织基本信息
        Origin origin = orgroomService.getOriginById(originId);
        if (origin == null || CommonUtil.isEmpty(origin.getOriginId())) {
            return "redirect:/org.action";
        }
        model.addAttribute("orgroom", origin);

        model.addAttribute("page");

        return "org/orgroom/orgroom-album-image";
    }

}


















