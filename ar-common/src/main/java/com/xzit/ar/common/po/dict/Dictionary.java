package com.xzit.ar.common.po.dict;

import com.xzit.ar.common.base.BaseEntity;

public class Dictionary extends BaseEntity {
    /**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = 1L;

	private String dictValue;

    private String dictName;

    private String remark;

    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue == null ? null : dictValue.trim();
    }

    public String getDictName() {
        return dictName;
    }

    public void setDictName(String dictName) {
        this.dictName = dictName == null ? null : dictName.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}