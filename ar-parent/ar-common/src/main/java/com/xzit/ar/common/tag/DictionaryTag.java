/**  
 * @Title: DictionaryTag.java
 * @Package com.xzit.ar.common.tag
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月8日 下午11:11:23
 * @version V1.0  
 */
package com.xzit.ar.common.tag;

import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.util.CommonUtil;

/**
 * @ClassName: DictionaryTag
 * @Description: TODO 字典引用标签，输出字典数据Name
 * @author Mr.Black
 * @date 2016年1月8日 下午11:11:23
 */
public class DictionaryTag extends BodyTagSupport {

	private String dict;

	private String dictdata;

	private static final long serialVersionUID = -3579175719405130600L;

	public DictionaryTag() {
		super();
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		try {
			// 校验参数
			if (CommonUtil.isEmpty(dictdata) && CommonUtil.isEmpty(dict)) {
				out.print("*");
				return SKIP_BODY;
			} else if (CommonUtil.isEmpty(dictdata)) {
				// 查阅数据字典
				String dictName = null;
				for (Map<String, Object> curDict : ARContext.dictionary) {
					if (curDict.get("dictValue").equals(dict)) {
						dictName = (String) curDict.get("dictName");
						break;
					}
				}
				// 校验查询结果
				if (dictName == null) {
					out.print("*");
				} else {
					out.print(dictName);
				}
			} else {
				// 查阅数据字典
				String dictdataName = null;
				for (Map<String, Object> curDict : ARContext.dictionary) {
					if (curDict.get("dictValue").equals(dict) && curDict.get("dictdataValue").equals(dictdata)) {
						dictdataName = (String) curDict.get("dictdataName");
						break;
					}
				}
				// 校验查询结果
				if (dictdataName == null) {
					out.print("*");
				} else {
					out.print(dictdataName);
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
		this.dict = null;
		this.dictdata = null;
		super.release();
	}

	public String getDict() {
		return dict;
	}

	public void setDict(String dict) {
		this.dict = dict;
	}

	public String getDictdata() {
		return dictdata;
	}

	public void setDictdata(String dictdata) {
		this.dictdata = dictdata;
	}

}
