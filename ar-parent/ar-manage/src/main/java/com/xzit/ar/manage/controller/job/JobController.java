/**  
 * @Title: RecruitController.java
 * @Package com.xzit.ar.manage.controller.job
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月9日 下午4:04:14
 * @version V1.0  
 */
package com.xzit.ar.manage.controller.job;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.recruit.Recruit;
import com.xzit.ar.common.po.recruit.RecruitUnit;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.job.FlatService;
import com.xzit.ar.manage.service.job.JobService;

/**
 * @ClassName: RecruitController
 * @Description: TODO 后台招聘管理处理
 * @author Mr.Black
 * @date 2016年2月9日 下午4:04:14
 */
@Controller
@RequestMapping("/job")
public class JobController extends BaseController {

	@Resource
	private JobService jobService;

	@Resource
	private FlatService flatService;

	@RequestMapping(value = "")
	public String indexJob(Model model) {
		return "job/job-index";
	}

	@RequestMapping("/queryJobs")
	public String queryJobs(Model model, String queryStr, String stateStr) throws ServiceException {
		Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
		// 默认加载的数据的状态
		if (stateStr == null) {
			stateStr = "A";
		}
		jobService.queryJobs(page, queryStr, stateStr);
		
		model.addAttribute("page", page);
		model.addAttribute("queryStr", queryStr);
		model.addAttribute("stateStr", stateStr);

		return "job/job-query";
	}

	@RequestMapping("/detailJob")
	public String detailJob(Model model, @RequestParam("recruitId") Integer recruitId) throws ServiceException {
		// 根据 id 查询招聘信息
		Map<String, Object> recruit = jobService.getDetailJob(recruitId);

		// 解析 福利待遇
		String benefit = (String) recruit.get("benefit");

		// 传递参数
		if (CommonUtil.isNotEmpty(benefit)) {
			String[] benefits = benefit.split(",");
			recruit.remove("benefit");
			model.addAttribute("benefits", benefits);
		}
		model.addAttribute("job", recruit);

		return "job/job-detail";
	}

	/**
	 * @Title: setTopJob @Description: TODO 招聘信息置顶 @return String @throws
	 */
	@RequestMapping(value = "/setTopJob", method = RequestMethod.POST)
	public String setTopJob(Model model, @RequestParam("recruitId") Integer recruitId) throws ServiceException {
		jobService.setTopJob(recruitId);
		return "redirect:queryJobs.action";
	}

	/**
	 * @Title: cancelTopJob
	 * @Description: TODO 取消置顶
	 */
	@RequestMapping(value = "/cancelTopJob", method = RequestMethod.POST)
	public String cancelTopJob(Model model, @RequestParam("recruitId") Integer recruitId) throws ServiceException {
		jobService.cancelTopJob(recruitId);
		return "redirect:queryJobs.action";
	}

	/**
	 * @Title: auditJob
	 * @Description: TODO 审核操作
	 */
	@RequestMapping(value = "/auditJob", method = RequestMethod.POST)
	public String auditJob(Model model, @RequestParam("recruitId") Integer recruitId) throws ServiceException {
		int row = jobService.auditJob(recruitId);
		if (row > 0) {
			setMessage(model, "审核成功！");
		}
		return "redirect:queryJobs.action";
	}

	@RequestMapping(value = "/auditJobs", method = RequestMethod.POST)
	public String auditJobs(Model model, @RequestParam("recruitIds") String recruitIds) throws ServiceException {
		int row = jobService.auditJobs(CommonUtil.splitIds(recruitIds));
		if (row > 0) {
			setMessage(model, "审核成功！");
		} else {
			setMessage(model, "审核失败！");
		}
		return "redirect:queryJobs.action";
	}

	/**
	 * @Title: deleteJob
	 * @Description: TODO 根据recruitId删除Job
	 */
	@RequestMapping(value = "/removeJob", method = RequestMethod.POST)
	public String removeJob(Model model, RedirectAttributes attr, @RequestParam("recruitId") Integer recruitId)
			throws ServiceException {
		int row = jobService.removeJob(recruitId);
		if (row > 0) {
			setMessage(model, "删除成功");
		}
		return "forward:queryJobs.action";
	}

	/**
	 * @Title: removeJobs
	 * @Description: TODO 批量删除
	 * @param @param
	 *            model
	 * @param @param
	 *            attr
	 * @param @param
	 *            recruitId
	 */
	@RequestMapping(value = "/removeJobs", method = RequestMethod.POST)
	public String removeJobs(Model model, RedirectAttributes attr, @RequestParam("recruitIds") String recruitIds)
			throws ServiceException {
		int row = jobService.removeJobs(CommonUtil.splitIds(recruitIds));
		if (row > 0) {
			setMessage(model, "删除成功");
		}
		return "forward:queryJobs.action";
	}

	/**
	 * @Title: deleteJob
	 * @Description: TODO 删除记录
	 * @param @param
	 *            model
	 * @param @param
	 *            recruitId
	 */
	@RequestMapping(value = "/deleteJob", method = RequestMethod.POST)
	public String deleteJob(Model model, @RequestParam("recruitId") Integer recruitId) throws ServiceException {
		int row = jobService.deleteJob(recruitId);
		if (row > 0) {
			setMessage(model, "彻底删除成功");
		}
		return "forward:queryJobs.action";
	}

	@RequestMapping(value = "/deleteJobs", method = RequestMethod.POST)
	public String deleteJobs(Model model, @RequestParam("recruitIds") String recruitIds) throws ServiceException {
		int row = jobService.deleteJobs(CommonUtil.splitIds(recruitIds));
		if (row > 0) {
			setMessage(model, "已彻底删除");
		}
		return "forward:queryJobs.action";
	}

	@RequestMapping("/createJob")
	public String createJob(Model model, Integer unitId) throws ServiceException {
		// 判断是否有单位信息，没有则选择/创建
		if (CommonUtil.isEmpty(unitId)) {
			// 判断当前用户创建公司情况
			List<RecruitUnit> unitList = flatService.getUnitsByUserId(getCurrentUserId());
			if (CommonUtil.isEmpty(unitList)) {
				// 创建新的
				return "forward:/flat/createFlat.action";
			} else if (unitList.size() > 0) {
				// 选择已经创建的
				model.addAttribute("flatList", unitList);
				return "job/flat/flat-select";
			}
		}

		// 加载招聘常量
		model.addAttribute("jobSalary", ARContext.positionSalary);
		model.addAttribute("jobBenefit", ARContext.positionBenefit);
		model.addAttribute("jobProf", ARContext.positionProf);
		model.addAttribute("unitId", unitId);
		super.setFormValid();

		return "job/job-add";
	}

	/**
	 * @Title: createJobSubmit
	 * @Description: TODO 招聘发布信息提交至后台
	 */
	@RequestMapping(value = "/createJobSubmit", method = RequestMethod.POST)
	public String createJobSubmit(Model model, RedirectAttributes attr, Recruit recruit) throws ServiceException {

		if (!validForm()) {
			setMessage(model, "发布失败！重复发布导致");
			return "job/job-result";
		} else {
			// 参数设定
			recruit.setCreateTime(new Date());
			recruit.setResumes(0);
			recruit.setUserId(getCurrentUserId());
			recruit.setState("A");
			recruit.setStateTime(new Date());
			if (jobService.createJob(recruit) > 0) {
				setMessage(model, "发布成功！");
			}
		}
		return "job/job-result";
	}

	/**
	 * @Title: recoverJob
	 * @Description: TODO 恢复数据
	 */
	@RequestMapping(value = "/recoverJob", method = RequestMethod.POST)
	public String recoverJob(Model model, @RequestParam("recruitId") Integer recruitId) throws ServiceException {
		int row = jobService.recoverJob(recruitId);
		if (row > 0) {
			setMessage(model, "数据成功恢复到未审核状态");
		}
		return "forward:queryJobs.action";
	}

	/**
	 * @Title: recoverJobs
	 * @Description: TODO 恢复数据
	 */
	@RequestMapping(value = "/recoverJobs", method = RequestMethod.POST)
	public String recoverJobs(Model model, RedirectAttributes attr, @RequestParam("recruitIds") String recruitIds)
			throws ServiceException {
		int row = jobService.recoverJobs(CommonUtil.splitIds(recruitIds));
		if (row > 0) {
			setMessage(model, "数据成功恢复到未审核状态");
		}
		return "forward:queryJobs.action";
	}
}
