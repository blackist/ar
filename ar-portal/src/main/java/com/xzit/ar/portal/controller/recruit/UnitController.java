/**
 * @Title: UnitController.java
 * @Package com.xzit.ar.portal.controller.recruit
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月4日 上午10:32:03
 * @version V1.0
 */
package com.xzit.ar.portal.controller.recruit;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.po.recruit.RecruitUnit;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.recruit.UnitService;

/**
 * @ClassName: UnitController
 * @Description: TODO UnitController
 * @author Mr.Black
 * @date 2016年2月4日 上午10:32:03
 */
@Controller
@RequestMapping("/unit")
public class UnitController extends BaseController {

    @Resource
    private UnitService unitService;

    @RequestMapping("/selectUnit")
    public String selectUnit(Model model, Integer unitId) throws ServiceException {
        // 获取所有 当前用户创建的公司信息
        List<RecruitUnit> unitList = unitService.getUnitsByUserId(getCurrentUserId());

        // 添加相关数据
        if (CommonUtil.isNotEmpty(unitId)) {
            model.addAttribute("unitId", unitId);
        }
        model.addAttribute("unitList", unitList);
        return "recruit/unit/unit-select";
    }

    @RequestMapping("/addUnit")
    public String addUnit(Model model) {
        // 相关选项
        model.addAttribute("unitProperty", ARContext.unitProperty);
        model.addAttribute("unitScale", ARContext.unitScale);
        model.addAttribute("unitIndustry", ARContext.unitIndustry);
        return "recruit/unit/unit-add";
    }

    @RequestMapping("/addUnitSubmit")
    public String addUnitSubmit(Model model, RecruitUnit unit, String isRecruiting) throws ServiceException {

        // 设置 uint 属性
        unit.setUserId(getCurrentUserId());
        unit.setStateTime(new Date());
        unit.setState("A");
        unitService.createUnit(unit);

        // 跳转
        if (isRecruiting != null && isRecruiting.equals("1")) {
            return "redirect:/recruit/addRecruit.action";
        }
        return "redirect:/unit/my.action";
    }

    /**
     * TODO 我的单位
     * @param model
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/my")
    public String my(Model model) throws ServiceException {
        // 查询我的单位
        model.addAttribute("unit", unitService.getUnitByUserId(getCurrentUserId()));
        // 相关选项
        model.addAttribute("unitProperty", ARContext.unitProperty);
        model.addAttribute("unitScale", ARContext.unitScale);
        model.addAttribute("unitIndustry", ARContext.unitIndustry);

        return "my/recruit/unit-detail";
    }

    /**
     * 更新单位信息
     * @param recruitUnit
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/update")
    public String update(RecruitUnit recruitUnit) throws ServiceException {
        // 参数校验
        if (recruitUnit != null && CommonUtil.isNotEmpty(recruitUnit.getUnitId())){
            unitService.updateUnit(recruitUnit);
        }

        return "redirect:/unit/my.action";
    }
}
