package com.xzit.ar.manage.controller.origin;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.origin.Origin;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.origin.OriginService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/18 22:12.
 */
@Controller
@RequestMapping("/origin")
public class OriginController extends BaseController {

    @Resource
    private OriginService originService;

    /**
     * TODO 加载组织管理界面
     *
     * @return
     */
    @RequestMapping("")
    public String index() {

        return "origin/origin-index";
    }

    /**
     * TODO 查询组织信息
     *
     * @param model
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/queryOrigin")
    public String queryOrigin(Model model, String query, String originGrade, String state, String originType) throws ServiceException {
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        // 校验查询条件
        Map<String, Object> origin = new HashMap<>();
        if (CommonUtil.isNotEmpty(query)) {
            origin.put("query", query);
        }
        if (CommonUtil.isNotEmpty(originGrade)) {
            origin.put("originGrade", originGrade);
        }
        if (CommonUtil.isNotEmpty(state)) {
            origin.put("state", state);
        }
        if (CommonUtil.isNotEmpty(originType)) {
            origin.put("originType", originType);
        }
        page.setQueryMap(origin);
        // 执行查询
        originService.queryOrigin(page);
        // 数据返回
        model.addAttribute("page", page);
        model.addAttribute("grades", ARContext.originGrade);
        model.addAttribute("types", ARContext.originType);
        // 查询条件返回
        model.addAttribute("query", query);
        model.addAttribute("originGrade", originGrade);
        model.addAttribute("originType", originType);
        model.addAttribute("state", state);

        return "origin/origin-query";
    }

    /**
     * TODO 加载新建组织页面
     *
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String add(Model model) {
        // 数据返回
        model.addAttribute("types", ARContext.originType);
        model.addAttribute("grades", ARContext.originGrade);

        return "origin/origin-add";
    }

    /**
     * TODO 保存组织信息
     *
     * @param origin
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/save")
    public String save(Origin origin) throws ServiceException {
        // 参数校验
        if (origin != null && CommonUtil.isNotEmpty(origin.getOriginName())
                && CommonUtil.isNotEmpty(origin.getOriginType())) {
            // 设置关键参数
            origin.setMgrId(getCurrentUserId());
            origin.setMembers(0);
            origin.setCreateTime(new Date());
            origin.setState("A");
            origin.setStateTime(new Date());

            originService.saveOrigin(origin);
        }

        return "redirect:/origin.action";
    }

    /**
     * TODO 更新组织信息
     * @param origin
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/update")
    public String update(Origin origin) throws ServiceException {
        // 关键参数校验
        if (origin != null && CommonUtil.isNotEmpty(origin.getOriginId())) {
            originService.updateOrigin(origin);
        }

        return "redirect:/origin.action";
    }

    /**
     * TODO 查询组织详情
     * @param model
     * @param originId
     * @return
     */
    @RequestMapping("/home")
    public String detail(Model model, @RequestParam("originId") Integer originId) throws ServiceException {
        // 查询班级信息
        // 信息返回
        model.addAttribute("origin", originService.getOriginById(originId));
        model.addAttribute("grades", ARContext.originGrade);
        model.addAttribute("types", ARContext.originType);

        return "origin/origin-home";
    }

    @RequestMapping("/member")
    public String member(Model model, @RequestParam("originId") Integer originId) throws ServiceException {
        // 参数校验
        if (CommonUtil.isNotEmpty(originId)){
            Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
            // 查询成员
            originService.getOriginMembers(page, originId);
            // 数据返回
            model.addAttribute("page", page);
        }
        model.addAttribute("origin", originService.getOriginById(originId));

        return "origin/origin-home-member";
    }
}
