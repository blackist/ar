package com.xzit.ar.portal.controller.my;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.portal.service.my.TaService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/9.
 */
@Controller
@RequestMapping("/ta")
public class TaController extends BaseController {

    @Resource
    private TaService taService;

    /**
     * TODO 用户个人主页
     * @param model
     * @param userId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/show")
    public String show(Model model, Integer userId) throws ServiceException {
        // 查询用户及本消息
        model.addAttribute("ta", taService.getUserBasicInfo(userId));

        return "my/ta/ta-index";
    }
}
