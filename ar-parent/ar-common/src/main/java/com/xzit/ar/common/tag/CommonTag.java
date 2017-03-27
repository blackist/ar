/**  
 * @Title: DictionaryTag.java
 * @Package com.xzit.ar.common.tag
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月8日 下午11:11:23
 * @version V1.0  
 */
package com.xzit.ar.common.tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * @ClassName: CommonTag
 * @Description: TODO 通用标签
 * @author Mr.Black
 * @date 2016年1月24日 下午11:11:29
 */
public class CommonTag extends BodyTagSupport {

	private String value;

	private static final long serialVersionUID = -3579175719405130600L;

	public CommonTag() {
		super();
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		try {
			
			out.print("HEH");
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
		super.release();
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
