/**  
* @Title: LoginController.java <br>
* @Package com.xzit.ar.manage.controller.login <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月23日 上午11:38:40 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.manage.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.manage.service.LoginService;

/**
 * @ClassName: LoginController <br>
 * @Description: TODO 登录Handler<br>
 * @author Mr.Black <br>
 * @date 2015年12月23日 上午11:38:40 <br>
 * @version V1.0 <br>
 */
public class LoginController extends BaseController {

	@Resource
	private LoginService loginService;

	@RequestMapping(method = RequestMethod.GET, value = "/manage")
	public String login(Model model, HttpServletRequest request) {
		model.addAttribute("uri", (String) request.getAttribute("uri"));
		return "main/login";
	}

	
}
