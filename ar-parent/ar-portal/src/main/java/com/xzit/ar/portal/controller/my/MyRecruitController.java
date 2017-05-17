package com.xzit.ar.portal.controller.my;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.portal.service.recruit.RecruitService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Map;

/**
 * 
 */
@Controller
@RequestMapping("/my/recruit")
public class MyRecruitController extends BaseController {

    @Resource
    private RecruitService recruitService;

    /**
     * TODO 加载我的招聘信息界面
     * @param model
     * @return
     * @throws ServiceException
     */
    @RequestMapping("")
    public String index(Model model) throws ServiceException {
        // 加载用户发布的招聘信息
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        recruitService.getRecruitByUserId(page, getCurrentUserId());
        model.addAttribute("page", page);

        return "my/recruit/recruit-index";
    }

    /**
     * TODO 刪除招聘信息
     * @param recruitId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/delete")
    public String delete(Integer recruitId) throws ServiceException {
        // 删除招聘信息
        recruitService.deleteRecruit(recruitId);

        return "redirect:/my/recruit.action";
    }
}
