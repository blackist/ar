package com.xzit.ar.common.po.user;

import java.util.Date;

import com.xzit.ar.common.base.BaseEntity;

public class UserJob extends BaseEntity {
    /**
     * @Fields serialVersionUID : TODO <br>
     */
    private static final long serialVersionUID = 1L;

    private Integer jobId;

    private String jobName;

    private String jobUnit;

    private String jobDate;

    private String jobDesc;

    private Date startTime;

    private Date endTime;

    private Date createTime;

    private Integer userId;

    private String state;

    private Date stateTime;

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getJobName() {
        return jobName;
    }

    public void setJobName(String jobName) {
        this.jobName = jobName == null ? null : jobName.trim();
    }

    public String getJobUnit() {
        return jobUnit;
    }

    public void setJobUnit(String jobUnit) {
        this.jobUnit = jobUnit == null ? null : jobUnit.trim();
    }

    public String getJobDate() {
        return jobDate;
    }

    public void setJobDate(String jobDate) {
        this.jobDate = jobDate == null ? null : jobDate.trim();
    }

    public String getJobDesc() {
        return jobDesc;
    }

    public void setJobDesc(String jobDesc) {
        this.jobDesc = jobDesc == null ? null : jobDesc.trim();
    }

    public Date getStartTime() {
        return createTime;
    }

    public void setStartTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getEndTime() {
        return createTime;
    }

    public void setEndTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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
}