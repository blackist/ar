/**  
 * @Title: SubStringTag.java
 * @Package com.xzit.ar.common.tag
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月27日 下午1:18:21
 * @version V1.0  
 */
package com.xzit.ar.common.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.xzit.ar.common.util.CommonUtil;

/**
 * @ClassName: SubStringTag
 * @Description: TODO 页面字符串长度限制标签
 * @author Mr.Black
 * @date 2016年2月27日 下午1:18:21
 */
public class SubStringTag extends BodyTagSupport {

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 7543452425485565949L;

	private String value;

	private Integer length;

	public SubStringTag() {
		super();
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		try {
			if (CommonUtil.isNotEmpty(value) && CommonUtil.isNotEmpty(length)) {
				//
				if (value.length() > length) {
					// 输出置顶样式
					out.print(value.subSequence(0, length) + "...");
				} else {
					out.print(value);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE;
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public void release() {
		this.value = null;
		this.length = null;
		super.release();
	}

	/**
	 * @return the value
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param value
	 *            the value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}

	/**
	 * @return the length
	 */
	public Integer getLength() {
		return length;
	}

	/**
	 * @param length
	 *            the length to set
	 */
	public void setLength(Integer length) {
		this.length = length;
	}

}
