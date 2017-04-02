package com.xzit.ar.common.po.dict;

import com.xzit.ar.common.base.BaseEntity;

public class DictionaryData extends BaseEntity {
    /**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String dictValue;

    private String dictdataName;

    private String dictdataValue;

    private String isFixed;

    private String isCancel;

    private Integer parentId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDictValue() {
        return dictValue;
    }

    public void setDictValue(String dictValue) {
        this.dictValue = dictValue == null ? null : dictValue.trim();
    }

    public String getDictdataName() {
        return dictdataName;
    }

    public void setDictdataName(String dictdataName) {
        this.dictdataName = dictdataName == null ? null : dictdataName.trim();
    }

    public String getDictdataValue() {
        return dictdataValue;
    }

    public void setDictdataValue(String dictdataValue) {
        this.dictdataValue = dictdataValue == null ? null : dictdataValue.trim();
    }

    public String getIsFixed() {
        return isFixed;
    }

    public void setIsFixed(String isFixed) {
        this.isFixed = isFixed == null ? null : isFixed.trim();
    }

    public String getIsCancel() {
        return isCancel;
    }

    public void setIsCancel(String isCancel) {
        this.isCancel = isCancel == null ? null : isCancel.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }
}