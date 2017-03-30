package com.xzit.ar.portal.controller.my;

import com.xzit.ar.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 
 */
@Controller
@RequestMapping("/my/recruit")
public class MyRecruitController extends BaseController {

    @RequestMapping("")
    public String index(Model model){
        
        return "my/recruit/recruit-index";
    }
}
