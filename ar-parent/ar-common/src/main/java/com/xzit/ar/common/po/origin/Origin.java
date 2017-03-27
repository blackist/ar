package com.xzit.ar.common.po.origin;

import java.util.Date;

import com.xzit.ar.common.base.BaseEntity;

public class Origin extends BaseEntity{
    /**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = 1L;

	private Integer originId;

    private String originName;

    private String originType;

    private String originGrade;

    private Integer members;

    private Date createTime;

    private Integer mgrId;

    private String state;

    private Date stateTime;

    private String exp1;

    private String exp2;

    private String originDesc;

    public Integer getOriginId() {
        return originId;
    }

    public void setOriginId(Integer originId) {
        this.originId = originId;
    }

    public String getOriginName() {
        return originName;
    }

    public void setOriginName(String originName) {
        this.originName = originName == null ? null : originName.trim();
    }

    public String getOriginType() {
        return originType;
    }

    public void setOriginType(String originType) {
        this.originType = originType == null ? null : originType.trim();
    }

    public String getOriginGrade() {
        return originGrade;
    }

    public void setOriginGrade(String originGrade) {
        this.originGrade = originGrade == null ? null : originGrade.trim();
    }

    public Integer getMembers() {
        return members;
    }

    public void setMembers(Integer members) {
        this.members = members;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Date getStateTime() {
        return stateTime;
    }

    public void setStateTime(Date stateTime) {
        this.stateTime = stateTime;
    }

    public String getExp1() {
        return exp1;
    }

    public void setExp1(String exp1) {
        this.exp1 = exp1 == null ? null : exp1.trim();
    }

    public String getExp2() {
        return exp2;
    }

    public void setExp2(String exp2) {
        this.exp2 = exp2 == null ? null : exp2.trim();
    }

    public String getOriginDesc() {
        return originDesc;
    }

    public void setOriginDesc(String originDesc) {
        this.originDesc = originDesc == null ? null : originDesc.trim();
    }

	/**
	 * @return the mgrId
	 */
	public Integer getMgrId() {
		return mgrId;
	}

	/**
	 * @param mgrId the mgrId to set
	 */
	public void setMgrId(Integer mgrId) {
		this.mgrId = mgrId;
	}
}