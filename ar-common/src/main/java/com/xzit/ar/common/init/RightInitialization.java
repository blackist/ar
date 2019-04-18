/**  
* @Title: RightInitialization.java <br>
* @Package com.xzit.ar.common.init <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午9:02:06 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.init;

/**
 * @ClassName: RightInitialization <br>
 * @Description: TODO 权限资源初始化 <br>
 * @author Mr.Black <br>
 * @date 2016年1月2日 下午9:02:06 <br>
 * @version V1.0 <br>
 */
public class RightInitialization implements Initialization {
	
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("---------权限资源初始化---------");
	}

	@Override
	public void destroy() throws Exception {
		
	}

}
