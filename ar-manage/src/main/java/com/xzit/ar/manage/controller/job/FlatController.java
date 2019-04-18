/**  
 * @Title: FlatController.java
 * @Package com.xzit.ar.manage.controller.job
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月10日 下午3:31:33
 * @version V1.0  
 */
package com.xzit.ar.manage.controller.job;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.po.recruit.RecruitUnit;
import com.xzit.ar.manage.service.job.FlatService;

/**
 * @ClassName: FlatController
 * @Description: TODO 处理招聘发布单位的信息
 * @author Mr.Black
 * @date 2016年2月10日 下午3:31:33
 */
@Controller
@RequestMapping("/flat")
public class FlatController extends BaseController {

	@Resource
	private FlatService flatService;

	/**
	 * @Title: createFlat
	 * @Description: TODO 跳转创建招聘单位界面
	 */
	@RequestMapping("/createFlat")
	public String createFlat(Model model) {
		// 相关选项
		model.addAttribute("unitProperty", ARContext.unitProperty);
		model.addAttribute("unitScale", ARContext.unitScale);
		model.addAttribute("unitIndustry", ARContext.unitIndustry);

		return "job/flat/flat-add";
	}

	/**
	 * @Title: createFlatSubmit
	 * @Description: TODO 存储界面提交的单位信息
	 * @param model
	 * @param unit
	 * @param isRecruiting
	 */
	@RequestMapping("/createFlatSubmit")
	public String createFlatSubmit(RedirectAttributes attr, RecruitUnit unit, String isRecruiting) throws ServiceException {

		// 设置 uint 属性
		unit.setUserId(getCurrentUserId());
		unit.setStateTime(new Date());
		unit.setState("A");
		flatService.createUnit(unit);

		// 跳转
		if (isRecruiting != null && isRecruiting.equals("1")) {
			return "redirect:/job/createJob.action";
		}
		return "";
	}
}
