/**  
 * @Title: ResumeController.java
 * @Package com.xzit.ar.portal.controller.my
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月7日 下午7:45:01
 * @version V1.0  
 */
package com.xzit.ar.portal.controller.my;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.user.UserResume;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.po.recruit.ResumePost;
import com.xzit.ar.portal.service.my.ResumeService;

/**
 * @ClassName: ResumeController
 * @Description: TODO 简历管理
 * @author Mr.Black
 * @date 2016年2月7日 下午7:45:01
 */
@Controller
@RequestMapping("/my/resume")
public class MyResumeController extends BaseController {

	@Resource
	private ResumeService resumeService;

	@RequestMapping("")
	public String index(Model model) throws ServiceException{
		// 加载简历列表
		model.addAttribute("resumes", resumeService.loadMyResumes(getCurrentUserId()));
		// 加载招聘常量
		model.addAttribute("positionSalary", ARContext.positionSalary);

		return "my/recruit/resume-index";
	}

	/**
	 * TODO 投递简历
	 * @param attr
	 * @param recruitId
	 * @param resumeId
	 * @return
	 * @throws ServiceException
	 */
	@RequestMapping(value = "/postResume", method = RequestMethod.POST)
	public String postResume(RedirectAttributes attr, @RequestParam("recruitId") Integer recruitId,
			@RequestParam("resumeId") Integer resumeId) throws ServiceException {

		// 参数设置
		ResumePost resumePost = new ResumePost();
		resumePost.setRecruitId(recruitId);
		resumePost.setResumeId(resumeId);
		resumePost.setCreateTime(new Date());
		resumePost.setState("A");
		resumePost.setStateTime(new Date());
		
		int row = resumeService.postResume(resumePost);
		if(row > 0){
			setMessage(null, "投递成功！");
		}
		
		attr.addAttribute("recruitId", recruitId);
		return "redirect:/recruit/detailRecruit.action";
	}

    /**
     * TODO 加载用户投递的简历信息
     * @param model
     * @return
     * @throws ServiceException
     */
	@RequestMapping("/posted")
	public String posted(Model model) throws ServiceException {
	    // 加载投递列表
        Page<Map<String, Object>> page = new Page<>(getPageIndex(), getPageSize());
        resumeService.getPostsByUserId(page, getCurrentUserId());
        model.addAttribute("page", page);

	    return "my/recruit/resume-posted";
    }

    /**
     * TODO 取消投递
     * @param recruitId
     * @param resumeId
     * @return
     * @throws ServiceException
     */
    @RequestMapping("/cancel")
    public String cancel(Integer recruitId, Integer resumeId) throws ServiceException {
	    // 取消投递
        resumeService.cancelPostResume(recruitId, resumeId);

	    return "redirect:/my/resume/posted.action";
    }

    /**
     * TODO 新建简历
     * @param model
     * @return
     */
	@RequestMapping("/addResume")
	public String addResume(Model model){
		// 加载招聘常量
		model.addAttribute("positionSalary", ARContext.positionSalary);
		
		return "my/recruit/resume-add";
	}

	/**
	 * @param model
	 * @param attr
	 * @param resume
	 * @return
	 * @throws ServiceException
	 */
	@RequestMapping("/addResumeSubmit")
	public String addResumeSubmit(Model model, RedirectAttributes attr, UserResume resume) throws ServiceException {

		resume.setState("A");
		resume.setStateTime(new Date());
		resume.setUserId(getCurrentUserId());
		resumeService.createResume(resume);

		return "redirect:/my/resume.action";
	}

	@RequestMapping("/detail")
	public String detail(Model model, @Param("resumeId") Integer resumeId) throws ServiceException{
		// 加载简历信息
		model.addAttribute("resume", resumeService.getResumeById(resumeId));

		return "my/recruit/resume-detail";
	}

	/**
	 * TODO 编辑简历，加载简历信息到编辑界面
	 * @param model
	 * @param resumeId
	 * @return
	 * @throws ServiceException
	 */
	@RequestMapping("/edit")
	public String edit(Model model, @Param("resumeId") Integer resumeId) throws ServiceException {
		// 加载简历信息
		model.addAttribute("resume", resumeService.getResumeById(resumeId));
		// 加载招聘常量
		model.addAttribute("positionSalary", ARContext.positionSalary);
		
		return "my/recruit/resume-edit";
	}

	/**
	 * TODO  更新简历信息
	 * @param model
	 * @param resume
	 * @return
	 * @throws ServiceException
	 */
	@RequestMapping("/update")
	public String update(Model model, UserResume resume) throws ServiceException {
		// 填补resume信息并更新，
		resume.setStateTime(new Date());
		if (resumeService.updateResume(resume) > 0){
			 setMessage(model, "简历更新成功");
		}
		return "redirect:/my/resume.action";
	}

	/**
	 * TODO 删除用户指定的简历
	 * @param model
	 * @param resumeId
	 * @return
	 * @throws ServiceException
	 */
	@RequestMapping("/delete")
	public String delete(Model model, @Param("resumeId") Integer resumeId) throws ServiceException {
		resumeService.deleteResume(resumeId);
		return "redirect:/my/resume.action";
	}
}
