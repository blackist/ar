/**  
 * @Title: MyController.java
 * @Package com.xzit.ar.portal.controller.my
 * @Description: TODO
 * @author QinChong
 * @date 2016年1月24日 下午1:01:58
 * @version V1.0  
 */
package com.xzit.ar.portal.controller.my;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;

/**
 * @ClassName: MyController
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月24日 下午1:01:58
 */
@Controller
@RequestMapping("/my")
public class MyController extends BaseController {

	@RequestMapping("")
	public String my() {
		return "my/my-index";
	}

}
