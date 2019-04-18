package com.xzit.ar.common.exception;

/**
 * 
* @ClassName: UtilException <br>
* @Description: TODO 调用工具类的异常<br>
* @author Mr.Black <br>
* @date 2015年12月21日 上午10:27:44 <br>
* @version V1.0  <br> <br>
 */
public class UtilException extends GlobalException {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -9019614054469957536L;

	/**
	 * UtilException
	 * 
	 * @param exception
	 *            <br>
	 */
	public UtilException(GlobalException exception) {
		super(exception);
	}

	/**
	 * UtilException
	 * 
	 * @param msg
	 *            <br>
	 */
	public UtilException(String msg) {
		super(msg);
	}

	/**
	 * UtilException
	 * 
	 * @param code
	 *            <br>
	 * @param msg
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public UtilException(int code, String msg, Object... params) {
		super(code, msg, params);
	}

	/**
	 * UtilException
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
	public UtilException(int code, String arg0, Throwable arg1, Object... params) {
		super(code, arg0, arg1, params);
	}

	/**
	 * UtilException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 */
	public UtilException(int code, String arg0, Throwable arg1) {
		super(code, arg0, arg1);
	}

	/**
	 * UtilException
	 * 
	 * @param code
	 *            <br>
	 * @param msg
	 *            <br>
	 */
	public UtilException(int code, String msg) {
		super(code, msg);
	}

	/**
	 * UtilException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 */
	public UtilException(int code, Throwable arg0) {
		super(code, arg0);
	}

	/**
	 * UtilException
	 * 
	 * @param code
	 *            <br>
	 */
	public UtilException(int code) {
		super(code);
	}

	/**
	 * UtilException
	 * 
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public UtilException(String arg0, GlobalException arg1, Object... params) {
		super(arg0, arg1, params);
	}

	/**
	 * UtilException
	 * 
	 * @param arg0
	 *            <br>
	 * @param exception
	 *            <br>
	 */
	public UtilException(String arg0, GlobalException exception) {
		super(arg0, exception);
	}

}
