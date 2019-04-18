package com.xzit.ar.common.mapper.info;

import com.xzit.ar.common.po.info.Collect;

public interface CollectMapper {
    int deleteByPrimaryKey(Integer collectId);

    int insert(Collect record);

    int insertSelective(Collect record);

    Collect selectByPrimaryKey(Integer collectId);

    int updateByPrimaryKeySelective(Collect record);

    int updateByPrimaryKey(Collect record);
}