package com.xzit.ar.common.po.user;

import java.util.Date;

import com.xzit.ar.common.base.BaseEntity;

public class UserResume extends BaseEntity {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	private Integer resumeId;

	private String resumeTitle;

	private String profType;

	private String expSalary;

	private String name;

	private String sex;

	private String domicile;

	private String contact;

	private String introduce;

	private Integer imageId;

	private Integer userId;

	private String state;

	private Date stateTime;

	private String exp1;

	private String exp2;

	public Integer getResumeId() {
		return resumeId;
	}

	public void setResumeId(Integer resumeId) {
		this.resumeId = resumeId;
	}

	public String getProfType() {
		return profType;
	}

	public void setProfType(String profType) {
		this.profType = profType == null ? null : profType.trim();
	}

	public String getExpSalary() {
		return expSalary;
	}

	public void setExpSalary(String expSalary) {
		this.expSalary = expSalary == null ? null : expSalary.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public String getDomicile() {
		return domicile;
	}

	public void setDomicile(String domicile) {
		this.domicile = domicile == null ? null : domicile.trim();
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact == null ? null : contact.trim();
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce == null ? null : introduce.trim();
	}

	public Integer getImageId() {
		return imageId;
	}

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
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

	public String getResumeTitle() {
		return resumeTitle;
	}

	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}
}