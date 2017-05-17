package com.xzit.ar.manage.controller.info;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.manage.service.info.InfoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/17 17:01.
 */
@Controller
@RequestMapping("/info")
public class InfoController extends BaseController {

    @Resource
    private InfoService infoService;

    /**
     * TODO 加载消息管理界面
     *
     * @return
     */
    @RequestMapping("")
    public String index() {
        return "info/info-index";
    }

    /**
     * TODO 查询站内信息
      * @param model
     * @param query
     * @param state
     * @param infoType
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/queryInfo")
    public String queryInfo(Model model, String query, String state, String infoType) throws ServiceException {
        // 查询消息
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        infoService.queryInfo(page, query, state, infoType);
        // 数据返回
        model.addAttribute("page", page);
        model.addAttribute("infoTypes", ARContext.infoType);
        // 查询条件返回
        model.addAttribute("query", query);
        model.addAttribute("state", state);
        model.addAttribute("infoType", infoType);

        return "info/info-query";
    }
}
