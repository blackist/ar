package com.xzit.ar.portal.controller.my;

import com.xzit.ar.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/9.
 */
@Controller
@RequestMapping("/ta")
public class TaController extends BaseController {



    @RequestMapping("/show")
    public String show(Model model){
        return "my/ta/ta-index";
    }
}