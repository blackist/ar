package com.xzit.ar.portal.controller.service;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.portal.service.information.InformationService;
import com.xzit.ar.portal.service.service.ServiceService;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * TODO 校园服务
 * Created by 董亮亮 on 2017/4/7.
 */
@Controller
@RequestMapping("/service")
public class ServiceController extends BaseController {

    @Resource
    private InformationService informationService;

    @Resource
    private ServiceService serviceService;

    /**
     * TODO 加载校园服务界面
     * @return
     */
    @RequestMapping("")
    public String index(Model model) throws ServiceException {
        List<Map<String, Object>> services = serviceService.getSchoolService("SS", 1);
        model.addAttribute("services", services);
        return "service/service-index";
    }

    /**
     * TODO 加载校园服务详细信息
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/school")
    public String school(Model model, @Param("id") Integer id) throws ServiceException {
        // 加载详细信息
        Information service = informationService.getInfoById(id);
        model.addAttribute("service", service);
        // 校园服务信息列表
        List<Map<String, Object>> services = serviceService.getSchoolService("SS", 1);
        model.addAttribute("services", services);
        
        return "service/service-school";
    }
}
