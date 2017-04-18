package com.xzit.ar.portal.controller.org;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.page.Page;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

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
    public String index(Model model, @RequestParam("orgId") Integer orgId){
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), 3);
        

        return "org/orgroom/orgroom-index";
    }
}
