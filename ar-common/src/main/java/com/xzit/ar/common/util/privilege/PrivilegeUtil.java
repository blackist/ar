/**  
* @Title: AuthorizationUtil.java <br>
* @Package com.xzit.ar.common.authorization.util <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月3日 下午3:00:38 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.util.privilege;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import com.xzit.ar.common.exception.GlobalException;
import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.mapper.role.RightMapper;
import com.xzit.ar.common.po.role.Right;
import com.xzit.ar.common.util.CommonUtil;

/**
 * @ClassName: AuthorizationUtil <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2016年1月3日 下午3:00:38 <br>
 * @version V1.0 <br>
 */
public class PrivilegeUtil {

	/**
	 * @Title: loadAllRights
	 * @Description: TODO 刷新环境中的所有权限
	 * @return List<Right>
	 */
	public static void refreshAllRights() throws GlobalException {
		try {
			RightMapper rightMapper = ARContext.applicationContext.getBean(RightMapper.class);
			// 加载数据库存有权限到环境
			ARContext.rightList = rightMapper.getAllRights();
		} catch (Exception e) {
			throw new GlobalException("刷新权限失败！");
		}
	}

	/**
	 * @Title: loadAllRights
	 * @Description: TODO 加载所有权限
	 * @return List<Right>
	 */
	public static void loadAllRights() throws UtilException {
		System.out.println("-------------------- 加载权限资源 --------------------");
		try {
			RightMapper rightMapper = ARContext.applicationContext.getBean(RightMapper.class);
			// 加载数据库存有权限到环境
			ARContext.rightList = rightMapper.getAllRights();
		} catch (Exception e) {
			throw new UtilException("加载权限失败！");
		}
	}

	/**
	 * @Title: detectAllRightURL
	 * @Description: TODO 扫描所有权限url
	 */
	public static List<String> detectAllRightURL() {
		List<String> rightUrlList = new ArrayList<String>();
		RequestMappingHandlerMapping rmhp = ARContext.applicationContext.getBean(RequestMappingHandlerMapping.class);
		Map<RequestMappingInfo, HandlerMethod> map = rmhp.getHandlerMethods();
		// 遍历 HandlerMapping
		for (Iterator<RequestMappingInfo> iterator = map.keySet().iterator(); iterator.hasNext();) {
			RequestMappingInfo info = iterator.next();
			// 获取 HandlerMapping URL
			String pattern = PrivilegeUtil.removeBeginAndLast(info.getPatternsCondition().toString());
			// 形成 权限URL Right.rightUrl
			System.out.println(pattern);
			// 加入权限列表
			rightUrlList.add(pattern);
		}
		return rightUrlList;
	}

	/**
	 * @Title: makeDefaultRight @Description: TODO 封装默认形式的权限 @param @param
	 *         rightUrl 封装权限的rightUrl @throws
	 */
	public static Right makeDefaultRight(String rightUrl) {
		Right right = null;
		// 参数校验
		if (CommonUtil.isNotEmpty(rightUrl)) {
			right = new Right();
			// 默认名称"未命名"
			right.setRightName("未命名");
			right.setRightUrl(rightUrl);
			// login 公共资源
			if (rightUrl.indexOf("login") > -1) {
				right.setIsPublic("1");
			} else {
				right.setIsPublic("0");
			}
			right.setState("A");
			right.setStateTime(new Date());
		}
		return right;
	}

	/**
	 * @Description: TODO 消去字符串第一个和最后一个字符 <br>
	 * @author Mr.Black <br>
	 * @date 2016年1月3日 下午3:03:14 <br>
	 */
	public static String removeBeginAndLast(String str) {
		if (CommonUtil.isNotEmpty(str) && str.length() > 1) {
			str = str.substring(1, str.length() - 1);
		}
		return str;
	}

	/**
	 * @Title: isPublic
	 * @Description: TODO 判断rightUrl 是否是公共资源
	 */
	public static boolean isPublic(String rightUrl) {
		// 系统未初始化，rightList不存在
		if (ARContext.rightList != null) {
			// 遍历权限List
			for (Right right : ARContext.rightList) {
				// 索引rightUrl对应的right
				if (right.getRightUrl().equals(rightUrl)) {
					if (right.getIsPublic().equals("1")) {
						// 若right.isPublic==1,则right是公共资源
						return true;
					}
					break;
				}
			}
		}
		return false;
	}
}
