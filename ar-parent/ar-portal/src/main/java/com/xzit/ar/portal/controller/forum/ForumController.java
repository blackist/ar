package com.xzit.ar.portal.controller.forum;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TODO 论坛模块
 * Created by 董亮亮 on 2017/4/8.
 */
@Controller
@RequestMapping("/forum")
public class ForumController {


    @RequestMapping("")
    public String index(Model model) {

        return "forum/forum-index";
    }
}
