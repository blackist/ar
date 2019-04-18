package com.xzit.ar.common.po.recruit;

import java.util.Date;

import com.xzit.ar.common.base.BaseEntity;

public class Recruit extends BaseEntity {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;

	private Integer recruitId;

	private String title;

	private Date endTime;

	private String prof;

	private Integer members;

	private Integer resumes;

	private String leaderName;

	private String leaderPhone;

	private String isTop;

	private String posName;

	private String posDesc;

	private String salary;

	private String benefit;

	private String workPlace;

	private Integer unitId;

	private Integer userId;

	private Date createTime;

	private String state;

	private Date stateTime;

	private String exp1;

	private String exp2;

	public Integer getRecruitId() {
		return recruitId;
	}

	public void setRecruitId(Integer recruitId) {
		this.recruitId = recruitId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title == null ? null : title.trim();
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getMembers() {
		return members;
	}

	public void setMembers(Integer members) {
		this.members = members;
	}

	public Integer getResumes() {
		return resumes;
	}

	public void setResumes(Integer resumes) {
		this.resumes = resumes;
	}

	public String getLeaderName() {
		return leaderName;
	}

	public void setLeaderName(String leaderName) {
		this.leaderName = leaderName == null ? null : leaderName.trim();
	}

	public String getLeaderPhone() {
		return leaderPhone;
	}

	public void setLeaderPhone(String leaderPhone) {
		this.leaderPhone = leaderPhone == null ? null : leaderPhone.trim();
	}

	public String getIsTop() {
		return isTop;
	}

	public void setIsTop(String isTop) {
		this.isTop = isTop == null ? null : isTop.trim();
	}

	public String getPosName() {
		return posName;
	}

	public void setPosName(String posName) {
		this.posName = posName == null ? null : posName.trim();
	}

	public String getPosDesc() {
		return posDesc;
	}

	public void setPosDesc(String posDesc) {
		this.posDesc = posDesc == null ? null : posDesc.trim();
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary == null ? null : salary.trim();
	}

	public String getBenefit() {
		return benefit;
	}

	public void setBenefit(String benefit) {
		this.benefit = benefit == null ? null : benefit.trim();
	}

	public String getWorkPlace() {
		return workPlace;
	}

	public void setWorkPlace(String workPlace) {
		this.workPlace = workPlace == null ? null : workPlace.trim();
	}

	public Integer getUnitId() {
		return unitId;
	}

	public void setUnitId(Integer unitId) {
		this.unitId = unitId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
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

	public String getProf() {
		return prof;
	}

	public void setProf(String prof) {
		this.prof = prof;
	}

	@Override
	public String toString() {
		return "Recruit [recruitId=" + recruitId + ", title=" + title + ", endTime=" + endTime + ", prof=" + prof
				+ ", members=" + members + ", resumes=" + resumes + ", leaderName=" + leaderName + ", leaderPhone="
				+ leaderPhone + ", isTop=" + isTop + ", posName=" + posName + ", posDesc=" + posDesc + ", salary="
				+ salary + ", benefit=" + benefit + ", workPlace=" + workPlace + ", unitId=" + unitId + ", userId="
				+ userId + ", createTime=" + createTime + ", state=" + state + ", stateTime=" + stateTime + ", exp1="
				+ exp1 + ", exp2=" + exp2 + "]";
	}

}