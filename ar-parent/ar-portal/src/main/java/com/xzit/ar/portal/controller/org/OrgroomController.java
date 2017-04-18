package com.xzit.ar.portal.controller.org;

import com.xzit.ar.common.base.BaseController;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TODO 校友组织主页
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/16 15:34.
 */
@Controller
@RequestMapping("/orgroom")
public class OrgroomController extends BaseController {


    /**
     * TODO 加载校友组织首页
     * @param model
     * @param orgId
     * @return
     */
    @RequestMapping("")
    public String index(Model model, @Param("orgId") Integer orgId){
        return "org/orgroom/orgroom-index";
    }
}
