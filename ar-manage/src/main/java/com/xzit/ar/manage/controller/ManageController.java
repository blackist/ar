/**  
* @Title: ManageController.java <br>
* @Package com.xzit.ar.manage <br>
* @Description: <br>
* @author Mr.Black <br>
* @date 2015年12月23日 上午11:44:17 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.manage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.constant.WebConstant;

/**
 * @ClassName: ManageController <br>
 * @Description: <br>
 * @author Mr.Black <br>
 * @date 2015年12月23日 上午11:44:17 <br>
 * @version V1.0 <br>
 */
@Controller
@RequestMapping("")
public class ManageController extends BaseController {

	/**
	 * @Description: 空请求跳转<br>
	 * @author Mr.Black <br>
	 * @date 2015年12月23日 下午12:36:56 <br>
	 */
	@RequestMapping(value = "/manage", method = RequestMethod.GET)
	public String index(ModelMap map) throws Exception {
		return "main/index";
	}

	/**
	 * @Description: 加载 欢迎界面 <br>
	 * @author Mr.Black <br>
	 * @date 2016年1月3日 下午4:23:41 <br>
	 */
	@RequestMapping("/manage/welcome")
	public String welcomeManage(Model model) {

		return "main/welcome";
	}

	/**
	 * @Description: 错误请求跳转<br>
	 * @author Mr.Black <br>
	 * @date 2015年12月23日 上午11:46:19 <br>
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/error/{errCode}")
	public String error(@PathVariable("errCode") String errCode) {
		return "404".equals(errCode) ? WebConstant.PAGE_ERROR_404 : WebConstant.PAGE_ERROR_500;
	}
}
