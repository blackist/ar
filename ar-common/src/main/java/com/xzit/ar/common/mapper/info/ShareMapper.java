package com.xzit.ar.common.mapper.info;

import com.xzit.ar.common.po.info.Share;

public interface ShareMapper {
    int insert(Share record);

    int insertSelective(Share record);
}