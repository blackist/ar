package com.xzit.ar.portal.controller.org;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.portal.service.org.OrgService;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * TODO 校友组织管理
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/16 15:32.
 */
@Controller
@RequestMapping("/org")
public class OrgController extends BaseController {

    @Resource
    private OrgService orgService;

    /**
     * TODO 加载校友组织列表
     * @param model
     * @return
     */
    @RequestMapping("")
    public String index(Model model){
        model.addAttribute("");
        return "org/org-index";
    }

    /**
     * TODO 加载院系分会
     * @param model
     * @return
     */
    @RequestMapping("/institute")
    public String institute(Model model) throws ServiceException {
        model.addAttribute("masses", orgService.getOriginByOriginType("orgi"));
        return "org/org-institute";
    }

    /**
     * TODO 加载社团分会
     * @param model
     * @return
     */
    @RequestMapping("/mass")
    public String mass(Model model) throws ServiceException {
        model.addAttribute("masses", orgService.getOriginByOriginType("orgm"));
        return "org/org-mass";
    }

    /**
     * TODO 加载学生协会
     * @param model
     * @return
     */
    @RequestMapping("/union")
    public String union(Model model) throws ServiceException {
        model.addAttribute("masses", orgService.getOriginByOriginType("orgu"));
        return "org/org-union";
    }

    /**
     * TODO 加载校友组织侧边栏
     * @param model
     * @param originType
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/outline")
    public String outline(Model model, @Param("originType") String originType) throws ServiceException {
        // 设置当前查询组织的类型
        model.addAttribute("originType", originType);
        // 按类型加载组织数
        model.addAttribute("originNum", orgService.getOrgNumByOriginType(originType));
        // 按组织类型加载组织用户数
        model.addAttribute("originMember", orgService.getOrgMemberByOriginType(originType));
        // 加载热度高的组织
        model.addAttribute("popOrgs", orgService.getPopOrgsByOriginType(originType));
        // 加载当前用户加入的组织
        model.addAttribute("myOrgs", orgService.getMyOrgsByUserId(getCurrentUserId(), originType));
        // 最新加入的校友
        model.addAttribute("latestMembers", orgService.getLatestMembersByOriginType(originType));

        return "org/org-outline";
    }
}
