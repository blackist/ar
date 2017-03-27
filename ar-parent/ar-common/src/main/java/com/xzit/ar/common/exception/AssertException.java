/**  
* @Title: AssertException.java <br>
* @Package com.xzit.ar.common.exception <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月21日 下午1:24:47 <br>
* @version V1.0 <br>
*/ 
package com.xzit.ar.common.exception;

/**
* @ClassName: AssertException <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月21日 下午1:24:47 <br>
* @version V1.0  <br> <br>
*/
public class AssertException extends GlobalException {

	/**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = 793213271166742835L;

	/**
	 * AssertException
	 * 
	 * @param exception
	 *            <br>
	 */
	public AssertException(GlobalException exception) {
		super(exception);
	}

	/**
	 * AssertException
	 * 
	 * @param msg
	 *            <br>
	 */
	public AssertException(String msg) {
		super(msg);
	}

	/**
	 * AssertException
	 * 
	 * @param code
	 *            <br>
	 * @param msg
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public AssertException(int code, String msg, Object... params) {
		super(code, msg, params);
	}

	/**
	 * AssertException
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
	public AssertException(int code, String arg0, Throwable arg1, Object... params) {
		super(code, arg0, arg1, params);
	}

	/**
	 * AssertException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 */
	public AssertException(int code, String arg0, Throwable arg1) {
		super(code, arg0, arg1);
	}

	/**
	 * AssertException
	 * 
	 * @param code
	 *            <br>
	 * @param msg
	 *            <br>
	 */
	public AssertException(int code, String msg) {
		super(code, msg);
	}

	/**
	 * AssertException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 */
	public AssertException(int code, Throwable arg0) {
		super(code, arg0);
	}

	/**
	 * AssertException
	 * 
	 * @param code
	 *            <br>
	 */
	public AssertException(int code) {
		super(code);
	}

	/**
	 * AssertException
	 * 
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public AssertException(String arg0, GlobalException arg1, Object... params) {
		super(arg0, arg1, params);
	}

	/**
	 * AssertException
	 * 
	 * @param arg0
	 *            <br>
	 * @param exception
	 *            <br>
	 */
	public AssertException(String arg0, GlobalException exception) {
		super(arg0, exception);
	}
}
