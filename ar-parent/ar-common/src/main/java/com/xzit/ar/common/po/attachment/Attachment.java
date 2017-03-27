package com.xzit.ar.common.po.attachment;

import java.util.Date;

import com.xzit.ar.common.base.BaseEntity;

public class Attachment extends BaseEntity {
    /**
	* @Fields serialVersionUID : TODO <br>
	*/ 
	private static final long serialVersionUID = 1L;

	private Integer attaId;

    private String attaType;

    private String attaName;

    private String isRemote;

    private String fileSize;

    private String filePath;

    private Integer downloads;

    private Date createTime;

    private Date expTime;

    public Integer getAttaId() {
        return attaId;
    }

    public void setAttaId(Integer attaId) {
        this.attaId = attaId;
    }

    public String getAttaType() {
        return attaType;
    }

    public void setAttaType(String attaType) {
        this.attaType = attaType == null ? null : attaType.trim();
    }

    public String getAttaName() {
        return attaName;
    }

    public void setAttaName(String attaName) {
        this.attaName = attaName == null ? null : attaName.trim();
    }

    public String getIsRemote() {
        return isRemote;
    }

    public void setIsRemote(String isRemote) {
        this.isRemote = isRemote == null ? null : isRemote.trim();
    }

    public String getFileSize() {
        return fileSize;
    }

    public void setFileSize(String fileSize) {
        this.fileSize = fileSize == null ? null : fileSize.trim();
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath == null ? null : filePath.trim();
    }

    public Integer getDownloads() {
        return downloads;
    }

    public void setDownloads(Integer downloads) {
        this.downloads = downloads;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getExpTime() {
        return expTime;
    }

    public void setExpTime(Date expTime) {
        this.expTime = expTime;
    }
}