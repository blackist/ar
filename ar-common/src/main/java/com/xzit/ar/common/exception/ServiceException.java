/**  
* @Title: ServiceException.java <br>
* @Package com.xzit.ar.common.exception <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月21日 上午10:37:33 <br>
* @version V1.0 <br>
*/ 
package com.xzit.ar.common.exception;

/**
* @ClassName: ServiceException <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月21日 上午10:37:33 <br>
* @version V1.0  <br> <br>
*/
public class ServiceException extends GlobalException {

	/**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = -637488670180675550L;

	/**
	 * ServiceException
	 * 
	 * @param exception
	 *            <br>
	 */
	public ServiceException(Exception exception) {
		super((GlobalException)exception);
	}

	/**
	 * ServiceException
	 * 
	 * @param msg
	 *            <br>
	 */
	public ServiceException(String msg) {
		super(msg);
	}

	/**
	 * ServiceException
	 * 
	 * @param code
	 *            <br>
	 * @param msg
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public ServiceException(int code, String msg, Object... params) {
		super(code, msg, params);
	}

	/**
	 * ServiceException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public ServiceException(int code, String arg0, Throwable arg1, Object... params) {
		super(code, arg0, arg1, params);
	}

	/**
	 * ServiceException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 */
	public ServiceException(int code, String arg0, Throwable arg1) {
		super(code, arg0, arg1);
	}

	/**
	 * ServiceException
	 * 
	 * @param code
	 *            <br>
	 * @param msg
	 *            <br>
	 */
	public ServiceException(int code, String msg) {
		super(code, msg);
	}

	/**
	 * ServiceException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 */
	public ServiceException(int code, Throwable arg0) {
		super(code, arg0);
	}

	/**
	 * ServiceException
	 * 
	 * @param code
	 *            <br>
	 */
	public ServiceException(int code) {
		super(code);
	}

	/**
	 * ServiceException
	 * 
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public ServiceException(String arg0, Exception arg1, Object... params) {
		super(arg0, (GlobalException)arg1, params);
	}

	/**
	 * ServiceException
	 * 
	 * @param arg0
	 *            <br>
	 * @param exception
	 *            <br>
	 */
	public ServiceException(String arg0, Exception exception) {
		super(arg0, (GlobalException)exception);
	}
}
