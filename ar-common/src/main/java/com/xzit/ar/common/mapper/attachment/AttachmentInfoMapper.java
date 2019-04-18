package com.xzit.ar.common.mapper.attachment;

import com.xzit.ar.common.po.attachment.AttachmentInfo;

public interface AttachmentInfoMapper {
    int insert(AttachmentInfo record);

    int insertSelective(AttachmentInfo record);
}