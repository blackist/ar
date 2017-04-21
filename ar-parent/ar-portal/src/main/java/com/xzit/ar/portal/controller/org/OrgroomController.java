package com.xzit.ar.portal.controller.org;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.org.OrgroomService;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.Date;
import java.util.Map;

/**
 * TODO 校友组织主页
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/16 15:34.
 */
@Controller
@RequestMapping("/orgroom")
public class OrgroomController extends BaseController {

    @Resource
    private OrgroomService orgroomService;


    /**
     * TODO 加载校友组织首页
     * @param model
     * @param originId
     * @return
     */
    @RequestMapping("")
    public String index(Model model, @RequestParam("originId") Integer originId) throws ServiceException {

        // 校友组织基本信息
        model.addAttribute("orgroom", orgroomService.getOriginById(originId));
        // 查询组织内最新消息
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), 3);
        model.addAttribute("latestInfos", orgroomService.getOriginInfos(page, originId));
        // 加载组织成员id 列表
        model.addAttribute("memberIds", orgroomService.getMemberIds(originId));

        return "org/orgroom/orgroom-index";
    }

    /**
     * TODO 发布组织动态消息，可以是图文信息
     * @param model   视图model
     * @param originId 组织id
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/info")
    public String info(Model model, @RequestParam("originId") Integer originId) throws ServiceException {
        // 校友组织基本信息
        model.addAttribute("orgroom", orgroomService.getOriginById(originId));
        // 分页查询组织内最新消息
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        orgroomService.getOriginInfos(page, originId);
        model.addAttribute("page", page);

        return "org/orgroom/orgroom-info";
    }

    /**
     * TODO 发布组织动态消息
     * @param attributes
     * @param content
     * @param originId
     * @return
     * @throws ServiceException
     * @author 董亮亮
     */
    @RequestMapping("/publishInfo")
    public String publishInfo(RedirectAttributes attributes, @RequestParam("content") String content, @RequestParam("originId") Integer originId) throws ServiceException {
        if (CommonUtil.isNotEmpty(content) && CommonUtil.isNotEmpty(originId)){
            Information information = new Information();
            // 设置消息内容
            information.setContent(content);
            information.setCreateTime(new Date());
            information.setUserId(getCurrentUserId());
            information.setOriginId(originId);
            information.setComments(0);
            information.setViews(0);
            information.setLoves(0);
            information.setIsTop("0");
            information.setInfoType("OI");
            information.setInfoTitle("");
            information.setState("A");
            information.setStateTime(new Date());
            information.setTheme("");
            information.setThumbImage("");
            // 存储数据库
            orgroomService.publishOriginInfo(information);
            setMessage(attributes, "发布成功！");

        }
        // 重定向
        attributes.addAttribute("originId", originId);
        setMessage(attributes, "发布失败！");

        return "redirect:/orgroom/info.action";
    }


    /**
     * TODO 加载班级动态详情
     * @param model
     * @param originId
     * @return
     */
    @RequestMapping("/infoDetail")
    public String infoDetail(Model model, Integer originId){
        return "org/orgroom/orgroom-info-detail";
    }

}


















