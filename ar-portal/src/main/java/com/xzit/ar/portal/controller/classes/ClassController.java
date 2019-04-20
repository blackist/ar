/**
 * @Title: ClassController.java
 * @Package com.xzit.ar.portal.controller.classroom
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月14日 下午11:42:54
 * @version V1.0
 */
package com.xzit.ar.portal.controller.classes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.origin.Grade;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.classes.ClassService;

/**
 * @author Mr.Black
 * @ClassName: ClassController
 * @Description: TODO
 * @date 2016年2月14日 下午11:42:54
 */
@Controller
@RequestMapping("/class")
public class ClassController extends BaseController {

    @Resource
    private ClassService classService;

    @RequestMapping("")
    public String index(Model model) throws ServiceException {
        List<Grade> gradeList = classService.getAll();

        // 变量传递
        model.addAttribute("gradeList", gradeList);
        model.addAttribute("classGrade", ARContext.originGrade);

        return "class/class-index";
    }

    /**
     * TODO 加载班记录信息侧边栏
     *
     * @param model
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/outlineClass")
    public String outlineClass(Model model) throws ServiceException {

        // 加载我的班级
        if (CommonUtil.isNotEmpty(getCurrentUserId())) {
            model.addAttribute("myClasses", classService.loadMyClass(getCurrentUserId()));
        }
        // 班级总数
        model.addAttribute("classNum", classService.countClassNum());
        // 班级录总成员数
        model.addAttribute("classMembers", classService.countClassMembers());
        // 人气班级
        model.addAttribute("popClasses", classService.loadPopularClass(5));
        // 近期校友
        model.addAttribute("latestMembers", classService.latestMembers(3));

        return "class/class-outline";
    }

    /**
     * TODO 查询班级
     *
     * @param model
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/queryClasses")
    public String queryClasses(Model model, String queryStr, String selectStr) throws ServiceException {
        // page 对象
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        Map<String, Object> clazz = new HashMap<>();
        if (CommonUtil.isNotEmpty(queryStr)) {
            clazz.put("query", "%" + queryStr + "%");
        }
        if (CommonUtil.isNotEmpty(selectStr)) {
            clazz.put("originGrade", selectStr);
        }
        page.setQueryMap(clazz);
        // 查询班级
        classService.queryOrigin(page);
        // 数据返回
        model.addAttribute("page", page);
        model.addAttribute("classGrade", ARContext.originGrade);
        model.addAttribute("queryStr", queryStr);
        model.addAttribute("selectStr", selectStr);

        return "class/class-query";
    }
}
