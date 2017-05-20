/**  
 * @Title: CmController.java
 * @Package com.xzit.ar.manage.controller.origin
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年3月2日 下午11:25:52
 * @version V1.0  
 */
package com.xzit.ar.manage.controller.classes;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.manage.service.classes.CmService;

/**
 * @ClassName: CmController
 * @Description: TODO 班级录后台管理
 * @author Mr.Black
 * @date 2016年3月2日 下午11:25:52
 */
@Controller
@RequestMapping("/cm")
public class CmController extends BaseController {

	@Resource
	private CmService cmService;

	@RequestMapping("")
	public String cm(Model model) {
		return "cm/cm-index";
	}

	@RequestMapping("/queryClass")
	public String queryClass(Model model, String queryStr) throws ServiceException {
		// page 对象
		Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
		// 查询班级
		// 数据返回
		model.addAttribute("page", cmService.queryClasses(page, queryStr, getSelectStr(), getStateStr()));
		model.addAttribute("classGrade", ARContext.originGrade);
		model.addAttribute("queryStr", queryStr);
		// 查询条件返回
		setSelectStr();
		setState();

		return "cm/cm-query";
	}

	/**
	 * @throws ServiceException
	 * @Title: excepClass
	 * @Description: TODO 异常冻结班级
	 */
	@RequestMapping("/excepClass")
	public String excepClass(Model model, @RequestParam("classId") Integer classId) throws ServiceException {
		// 执行冻结操作
		if (!(cmService.updateClassState(classId, "E") > 0)) {
			setMessage(model, "冻结失败");
		} else {
			setMessage(model, "冻结成功");
		}
		return "forward:queryClass.action";
	}

	/**
	 * @Title: recoverClass
	 * @Description: TODO 删除班级
	 */
	@RequestMapping("/recoverClass")
	public String recoverClass(Model model, @RequestParam("classId") Integer classId) throws ServiceException {
		// 执行恢复操作
		if (!(cmService.updateClassState(classId, "A") > 0)) {
			setMessage(model, "恢复失败");
		} else {
			setMessage(model, "恢复成功");
		}
		return "forward:queryClass.action";
	}

	/**
	 * @Title: removeClass
	 * @Description: TODO 删除班级
	 */
	@RequestMapping("/removeClass")
	public String removeClass(Model model, @RequestParam("classId") Integer classId) throws ServiceException {
		// 执行删除操作
		if (!(cmService.updateClassState(classId, "X") > 0)) {
			setMessage(model, "删除失败");
		} else {
			setMessage(model, "删除成功");
		}
		return "forward:queryClass.action";
	}

	/**
	 * @Title: deleteClass
	 * @Description: TODO 彻底删除班级
	 */
	@RequestMapping("/deleteClass")
	public String deleteClass(Model model, @RequestParam("classId") Integer classId) throws ServiceException {
		// 执行彻底删除操作
		if (!(cmService.deleteClass(classId) > 0)) {
			setMessage(model, "彻底删除失败");
		} else {
			setMessage(model, "彻底删除成功");
		}
		return "forward:queryClass.action";
	}
}
