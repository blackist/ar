package com.xzit.ar.common.po.recruit;

import java.util.Date;

import com.xzit.ar.common.base.BaseEntity;

public class RecruitUnit extends BaseEntity {
    /**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = 1L;

	private Integer unitId;

    private String unitName;

    private String industry;

    private String property;

    private String scale;

    private String unitWeb;

    private Integer recruitId;
    
    private Integer userId;

    private String state;

    private Date stateTime;

    private String unitDesc;

    public Integer getUnitId() {
        return unitId;
    }

    public void setUnitId(Integer unitId) {
        this.unitId = unitId;
    }

    public String getUnitName() {
        return unitName;
    }

    public void setUnitName(String unitName) {
        this.unitName = unitName == null ? null : unitName.trim();
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry == null ? null : industry.trim();
    }

    public String getProperty() {
        return property;
    }

    public void setProperty(String property) {
        this.property = property == null ? null : property.trim();
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale == null ? null : scale.trim();
    }

    public String getUnitWeb() {
        return unitWeb;
    }

    public void setUnitWeb(String unitWeb) {
        this.unitWeb = unitWeb == null ? null : unitWeb.trim();
    }

    public Integer getRecruitId() {
        return recruitId;
    }

    public void setRecruitId(Integer recruitId) {
        this.recruitId = recruitId;
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

    public String getUnitDesc() {
        return unitDesc;
    }

    public void setUnitDesc(String unitDesc) {
        this.unitDesc = unitDesc == null ? null : unitDesc.trim();
    }

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}