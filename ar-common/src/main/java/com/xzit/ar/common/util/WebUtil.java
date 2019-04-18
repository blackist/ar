/**  
* @Title: WebUtil.java <br>
* @Package com.xzit.ar.common.util <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月21日 下午3:44:47 <br>
* @version V1.0 <br>
*/ 
package com.xzit.ar.common.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.xzit.ar.common.constant.WebConstant;
import com.xzit.ar.common.po.user.User;

/**
* @ClassName: WebUtil <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月21日 下午3:44:47 <br>
* @version V1.0  <br> <br>
*/
public final class WebUtil {

	/**
     * 默认构造函数
     */
    private WebUtil() {
    }
    
	/**
	* @Description: TODO 获取当前操作员id <br>
	* @param @return <br>
	* @return Integer <br>
	* @author Mr.Black <br>
	* @date 2015年12月21日 下午4:11:43 <br>
	 */
	public static Integer getCurrentAdminId() {
		User user = getCurrentAdmin();
		if(user != null) {
			return user.getUserId();
		}
		return null;
	}
	/**
	* @Description: TODO 获取当前操作员<br>
	* @author Mr.Black <br>
	* @date 2015年12月21日 下午4:09:21 <br>
	 */
	public static User getCurrentAdmin() {
		RequestAttributes requestAttr = RequestContextHolder.getRequestAttributes();
        if (requestAttr instanceof ServletRequestAttributes) {
            HttpServletRequest request = ((ServletRequestAttributes) requestAttr).getRequest();
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute(WebConstant.SESSION_ADMIN);
            if (user != null) {
            	return user;
            }
        }
		return null;
	}
	
	/**
	* @Description: TODO 判断是否拥有权限<br>
	* @author Mr.Black <br>
	* @date 2015年12月21日 下午4:10:13 <br>
	 */
	public boolean hasRight() {
		
		return false;
	}
	
	/**
	* @Description: TODO 设置属性值<br>
	* @author Mr.Black <br>
	* @date 2015年12月21日 下午3:47:28 <br>
	 */
    public static void setAttribute(String attrCode, Object attrValue) {
        RequestAttributes requestAttr = RequestContextHolder.getRequestAttributes();
        if (requestAttr instanceof ServletRequestAttributes) {
            HttpServletRequest request = ((ServletRequestAttributes) requestAttr).getRequest();
            request.getSession().setAttribute(attrCode, attrValue);
        }
    }

    /**
    * @Description: TODO 获取属性值<br>
    * @return Object <br>
    * @author Mr.Black <br>
    * @date 2015年12月21日 下午3:47:11 <br>
     */
    public static Object getAttribute(String attrCode) {
        Object obj = null;
        RequestAttributes requestAttr = RequestContextHolder.getRequestAttributes();
        if (requestAttr instanceof ServletRequestAttributes) {
            HttpServletRequest request = ((ServletRequestAttributes) requestAttr).getRequest();
            obj = request.getAttribute(attrCode);
            if (obj == null) {
                obj = request.getSession().getAttribute(attrCode);
            }
        }
        return obj;
    }
    
    /**
    * @Description: TODO 删除属性值<br>
    * @author Mr.Black <br>
    * @date 2015年12月21日 下午3:46:59 <br>
     */
    public static void removeAttribute(String code) {
        RequestAttributes requestAttr = RequestContextHolder.getRequestAttributes();
        if (requestAttr instanceof ServletRequestAttributes) {
            HttpServletRequest request = ((ServletRequestAttributes) requestAttr).getRequest();
            request.removeAttribute(code);
            request.getSession().removeAttribute(code);
        }
    }
    
    /**
    * @Description: TODO 获取IP<br>
    * @author Mr.Black <br>
    * @date 2015年12月21日 下午3:48:08 <br>
     */
    public static String getRemoteIP(HttpServletRequest request) {
        String ip = "";
        if (request.getHeader("x-forwarded-for") == null) {
            ip = request.getRemoteAddr();
        }
        else {
            ip = request.getHeader("x-forwarded-for");
        }
        return "0:0:0:0:0:0:0:1".equals(ip) ? "127.0.0.1" : ip;
    }

}
