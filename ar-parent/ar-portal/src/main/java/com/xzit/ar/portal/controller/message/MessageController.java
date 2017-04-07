/**  
 * @Title: MessageController.java
 * @Package com.xzit.ar.portal.controller.message
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月17日 下午3:01:12
 * @version V1.0  
 */
package com.xzit.ar.portal.controller.message;

import com.xzit.ar.common.po.message.Message;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;

/**
 * @ClassName: MessageController
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月17日 下午3:01:12
 */
@Controller
@RequestMapping("/message")
public class MessageController extends BaseController {

	/**
	 * @Title: contactUs
	 * @Description: TODO 加载联系我们表单
	 */
	@RequestMapping("")
	public String contactUs() {
		return "msg/contact-us";
	}

}
