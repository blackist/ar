/**  
 * @Title: CrmController.java
 * @Package com.xzit.ar.manage.controller.origin
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年3月3日 下午4:56:12
 * @version V1.0  
 */
package com.xzit.ar.manage.controller.classes;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xzit.ar.common.base.BaseController;

/**
 * @ClassName: CrmController
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年3月3日 下午4:56:12
 */
@Controller
@RequestMapping("crm")
public class CrmController extends BaseController {

	@RequestMapping("")
	public String index(Model model, @RequestParam("classId") Integer classId) {
		
		
		return "";
	}
}
