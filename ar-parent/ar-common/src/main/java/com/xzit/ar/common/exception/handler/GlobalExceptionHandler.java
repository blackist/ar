/**  
* @Title: GlobalExceptionHandler.java <br>
* @Package com.xzit.ar.common.exception.handler <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月1日 下午10:07:14 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.exception.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.xzit.ar.common.constant.WebConstant;
import com.xzit.ar.common.exception.GlobalException;

/**
 * @ClassName: GlobalExceptionHandler <br>
 * @Description: TODO 全局异常处理器<br>
 * @author Mr.Black <br>
 * @date 2016年1月1日 下午10:07:14 <br>
 * @version V1.0 <br>
 */
public class GlobalExceptionHandler implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
			Exception e) {
		// 抛向界面的异常信息
		String message = null;
		GlobalException globalException = null;

		// 1、解析系统抛出的异常
		if (e instanceof GlobalException) {
			globalException = ((GlobalException) e);
		} else {
			globalException = new GlobalException("未知错误");
		}
		// 2、获取异常信息
		message = globalException.getMsg();

		// 3、发送到默认的错误界面
		ModelAndView mav = new ModelAndView();
		
		// 填充错误信息
		mav.addObject("exception", e);
		mav.addObject("URL", request.getRequestURL());
		mav.addObject("message", message);

		mav.setViewName(WebConstant.DEFAULT_ERROR_VIEW);

		return mav;
	}
}
