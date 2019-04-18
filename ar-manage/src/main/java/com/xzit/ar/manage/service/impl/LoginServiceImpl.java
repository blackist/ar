/**  
* @Title: LoginServiceImpl.java <br>
* @Package com.xzit.ar.manage.service.impl <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午2:47:21 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.manage.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.user.UserMapper;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.LoginService;

/**
 * @ClassName: LoginServiceImpl <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2016年1月2日 下午2:47:21 <br>
 * @version V1.0 <br>
 */
public class LoginServiceImpl implements LoginService {
	@Resource
	private UserMapper userMapper;

	@Override
	public Map<String, Object> validateUser(String account, String password) throws ServiceException {
		Map<String, Object> user = null;
		try {
			// 关键参数校验
			if (CommonUtil.isNotEmpty(account) && CommonUtil.isNotEmpty(password)) {
				// 查找用户
				user = userMapper.selectByAccount(account);
				if (user != null) {
					// 校验密码
					if (password.equals(user.get("password"))) {
						// 加载用户关联信息
						//Integer userId = (Integer) (user.get("userId"));
					} else {
						user.put("userId", null);
						user.put("password", null);
					}
				}
			}
		} catch (Exception e) {
			throw new ServiceException("系统异常，登录失败");
		}
		return user;
	}

}
