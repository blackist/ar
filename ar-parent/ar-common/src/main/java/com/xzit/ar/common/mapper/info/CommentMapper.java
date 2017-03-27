package com.xzit.ar.common.mapper.info;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;

public interface CommentMapper extends BaseMapper {

	List<Map<String, Object>> loadInfoComment(@Param("infoId") Integer infoId);
}