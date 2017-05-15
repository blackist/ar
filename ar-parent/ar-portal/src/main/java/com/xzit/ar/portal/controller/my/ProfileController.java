/**  
 * @Title: ProfileController.java
 * @Package com.xzit.ar.portal.controller.my
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月13日 上午12:32:02
 * @version V1.0  
 */
package com.xzit.ar.portal.controller.my;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;

/**
 * @ClassName: ProfileController
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月13日 上午12:32:02
 */
@Controller
@RequestMapping("/my/profile")
public class ProfileController extends BaseController {

	@RequestMapping("/basic")
	public String basic(Model model) {
		// 查询用户资料
		

		model.addAttribute("userInfo");

		return "my/profile/profile-basic";
	}

	@RequestMapping("/detail")
	public String detail(Model model) {
		return "my/profile/profile-detail";
	}
	
	@RequestMapping("/job")
	public String job(Model model) {
		return "my/profile/profile-job";
	}
	
	@RequestMapping("/portrait")
	public String portrait(Model model) {
		return "my/profile/profile-portrait";
	}
}
