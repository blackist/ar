package com.xzit.ar.portal.controller.news;

import com.xzit.ar.common.base.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/5/3 21:29.
 */
@Controller
@RequestMapping("/news")
public class NewsController extends BaseController {


    /**
     * TODO 加载新闻中心界面
     * @param model
     * @return
     */
    @RequestMapping("")
    public String index(Model model) {

        // 数据传递
        model.addAttribute("");
        
        return "news/news-index";
    }
    
}
