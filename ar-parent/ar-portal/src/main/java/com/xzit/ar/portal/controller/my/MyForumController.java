package com.xzit.ar.portal.controller.my;

import com.xzit.ar.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/4 14:32.
 */
@Controller
@RequestMapping("/my/forum")
public class MyForumController extends BaseController {



    @RequestMapping("")
    public String index(Model model) {

        model.addAttribute("");

        return "my/forum/forum-index";
    }
}
