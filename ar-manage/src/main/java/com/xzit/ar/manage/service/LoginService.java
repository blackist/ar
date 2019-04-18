/**  
* @Title: LoginService.java <br>
* @Package com.xzit.ar.manage.service <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午2:45:14 <br>
* @version V1.0 <br>
*/ 
package com.xzit.ar.manage.service;

import java.util.Map;

import com.xzit.ar.common.exception.ServiceException;

/**
* @ClassName: LoginService <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午2:45:14 <br>
* @version V1.0  <br>
*/
public interface LoginService {
	
	public Map<String, Object> validateUser(String account, String password) throws ServiceException;
}
