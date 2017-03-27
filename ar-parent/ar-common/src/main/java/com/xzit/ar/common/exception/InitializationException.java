/**  
* @Title: InitializationException.java <br>
* @Package com.xzit.ar.common.init <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月2日 下午8:28:45 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.exception;

/**
 * @ClassName: InitializationException <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2016年1月2日 下午8:28:45 <br>
 * @version V1.0 <br>
 */
public class InitializationException extends GlobalException {

	/**
	 * @Fields serialVersionUID : TODO <br>
	 */
	private static final long serialVersionUID = -6111311456939773773L;

	/**
	 * InitializationException
	 * @param exception
	 */
	public InitializationException(GlobalException exception) {
		super(exception);
	}

	/**
	 * InitializationException
	 * @param msg
	 */
	public InitializationException(String msg) {
		super(msg);
	}

	/**
	 * InitializationException
	 * @param code
	 * @param msg
	 * @param params
	 */
	public InitializationException(int code, String msg, Object... params) {
		super(code, msg, params);
	}

	/**
	 * InitializationException
	 * @param code
	 * @param arg0
	 * @param arg1
	 * @param params
	 */
	public InitializationException(int code, String arg0, Throwable arg1, Object... params) {
		super(code, arg0, arg1, params);
	}

	/**
	 * InitializationException
	 * @param code
	 * @param arg0
	 * @param arg1
	 */
	public InitializationException(int code, String arg0, Throwable arg1) {
		super(code, arg0, arg1);
	}

	/**
	 * InitializationException
	 * @param code
	 * @param msg
	 */
	public InitializationException(int code, String msg) {
		super(code, msg);
	}

	/**
	 * InitializationException
	 * @param code
	 * @param arg0
	 */
	public InitializationException(int code, Throwable arg0) {
		super(code, arg0);
	}

	/**
	 * InitializationException
	 * @param code
	 */
	public InitializationException(int code) {
		super(code);
	}

	/**
	 * InitializationException
	 * @param arg0
	 * @param arg1
	 * @param params
	 */
	public InitializationException(String arg0, GlobalException arg1, Object... params) {
		super(arg0, arg1, params);
	}

	/**
	 * InitializationException
	 * @param arg0
	 * @param exception
	 */
	public InitializationException(String arg0, GlobalException exception) {
		super(arg0, exception);
	}

}
