package com.xzit.ar.common.mapper.message;

import com.xzit.ar.common.po.message.Message;

public interface MessageMapper {
    int deleteByPrimaryKey(Integer msgId);

    int insert(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer msgId);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
}