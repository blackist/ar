/**  
* @Title: CustomException.java <br>
* @Package com.xzit.ar.exception <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月10日 下午7:09:38 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.exception;

import java.text.MessageFormat;

/**
 * @ClassName: CustomException <br>
 * @Description: TODO 系统自定义异常 , 预期异常, 需要在系统中抛出此类异常<br>
 * @author Mr.Black <br>
 * @date 2015年12月10日 下午7:09:38 <br>
 * @version V1.0 <br>
 *          <br>
 */

public class GlobalException extends Exception {

	/**
	 * @Fields serialVersionUID : TODO <br>
	 */
	private static final long serialVersionUID = 5076963716058925012L;

	// 错误代码
	private int code;

	// 错误信息
	private String msg;

	/**
	 * 
	 * Title: <br>
	 * Description:TODO <br>
	 * 
	 * @param code
	 */
	public GlobalException(int code) {
		super();
		this.code = code;
	}

	/**
	 * 
	 * Title: <br>
	 * Description:TODO <br>
	 * 
	 * @param msg
	 */
	public GlobalException(String msg) {
		this.msg = msg;
	}

	/**
	 * Title: <br>
	 * Description:TODO <br>
	 * 
	 * @param code
	 * @param msg
	 */
	public GlobalException(int code, String msg) {
		this.msg = msg;
		this.code = code;
	}

	/**
	 * 
	 * Title: <br>
	 * Description:TODO <br>
	 * @param code
	 * @param msg
	 * @param params
	 */
	public GlobalException(int code, String msg, Object... params) {
		this(code, MessageFormat.format(msg, params));
	}

	/**
	 * 
	 * Title: <br>
	 * Description:TODO <br>
	 * @param exception
	 */
	public GlobalException(GlobalException exception) {
		this(exception.code, exception);
	}

	/**
	 * 
	 * Title: <br>
	 * Description:TODO <br>
	 * 
	 * @param code
	 * @param arg0
	 */
	public GlobalException(int code, Throwable arg0) {
		super(arg0);
		this.code = code;
	}

	/**
	 * 
	 * Title: <br>
	 * Description:TODO <br>
	 * 
	 * @param arg0
	 * @param exception
	 *            <br>
	 */
	public GlobalException(String arg0, GlobalException exception) {
		this(exception.code, arg0, exception);
	}

	/**
	 * 
	 * Title: <br>
	 * Description:TODO <br>
	 * 
	 * @param code
	 * @param arg0
	 * @param arg1
	 */
	public GlobalException(int code, String arg0, Throwable arg1) {
		super(arg0, arg1);
		this.code = code;
	}

	/**
	 * FrameworkException
	 * 
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public GlobalException(String arg0, GlobalException arg1, Object... params) {
		this(arg1.code, MessageFormat.format(arg0, params), arg1);
	}

	/**
	 * 
	* @Title: getCode <br>
	* @Description: TODO <br>
	* @param @return <br>
	* @return int <br>
	* @author Mr.Black <br>
	* @date 2015年12月21日 上午10:33:17 <br>
	* @throws <br>
	 */
	public int getCode() {
		return code;
	}

	/**
	 * 
	* @Title: getMsg <br>
	* @Description: TODO <br>
	* @param @return <br>
	* @return String <br>
	* @author Mr.Black <br>
	* @date 2015年12月21日 上午10:33:22 <br>
	* @throws <br>
	 */
	public String getMsg() {
		return msg;
	}

}
