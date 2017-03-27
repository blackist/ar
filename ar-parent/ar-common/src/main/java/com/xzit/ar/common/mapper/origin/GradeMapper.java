package com.xzit.ar.common.mapper.origin;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.base.BaseMapper;

public interface GradeMapper extends BaseMapper {

	List<Map<String, Object>> loadGradeList() throws Exception;
}