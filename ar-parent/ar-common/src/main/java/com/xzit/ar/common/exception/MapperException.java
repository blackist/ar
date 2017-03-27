/**  
* @Title: MapperException.java <br>
* @Package com.xzit.ar.common.exception <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月21日 上午10:29:09 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.exception;

/**
 * @ClassName: MapperException <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2015年12月21日 上午10:29:09 <br>
 * @version V1.0 <br>
 *          <br>
 */
public class MapperException extends GlobalException {

	/**
	 * @Fields serialVersionUID : TODO <br>
	 */
	private static final long serialVersionUID = -8652966032767445395L;

	/**
	 * MapperException
	 * 
	 * @param exception
	 *            <br>
	 */
	public MapperException(GlobalException exception) {
		super(exception);
	}

	/**
	 * MapperException
	 * 
	 * @param msg
	 *            <br>
	 */
	public MapperException(String msg) {
		super(msg);
	}

	/**
	 * MapperException
	 * 
	 * @param code
	 *            <br>
	 * @param msg
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public MapperException(int code, String msg, Object... params) {
		super(code, msg, params);
	}

	/**
	 * MapperException
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
	public MapperException(int code, String arg0, Throwable arg1, Object... params) {
		super(code, arg0, arg1, params);
	}

	/**
	 * MapperException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 */
	public MapperException(int code, String arg0, Throwable arg1) {
		super(code, arg0, arg1);
	}

	/**
	 * MapperException
	 * 
	 * @param code
	 *            <br>
	 * @param msg
	 *            <br>
	 */
	public MapperException(int code, String msg) {
		super(code, msg);
	}

	/**
	 * MapperException
	 * 
	 * @param code
	 *            <br>
	 * @param arg0
	 *            <br>
	 */
	public MapperException(int code, Throwable arg0) {
		super(code, arg0);
	}

	/**
	 * MapperException
	 * 
	 * @param code
	 *            <br>
	 */
	public MapperException(int code) {
		super(code);
	}

	/**
	 * MapperException
	 * 
	 * @param arg0
	 *            <br>
	 * @param arg1
	 *            <br>
	 * @param params
	 *            <br>
	 */
	public MapperException(String arg0, GlobalException arg1, Object... params) {
		super(arg0, arg1, params);
	}

	/**
	 * MapperException
	 * 
	 * @param arg0
	 *            <br>
	 * @param exception
	 *            <br>
	 */
	public MapperException(String arg0, GlobalException exception) {
		super(arg0, exception);
	}

}
