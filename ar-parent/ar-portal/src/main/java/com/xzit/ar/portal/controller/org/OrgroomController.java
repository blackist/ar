package com.xzit.ar.portal.controller.org;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.portal.service.org.OrgroomService;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
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
        model.addAttribute("latestInfos", orgroomService.getLatestInfosByOriginId(page, originId));
        // 加载组织成员id 列表
        model.addAttribute("memberIds", orgroomService.getMemberIds(originId));

        return "org/orgroom/orgroom-index";
    }
}


















