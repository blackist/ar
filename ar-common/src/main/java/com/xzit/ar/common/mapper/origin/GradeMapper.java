package com.xzit.ar.common.mapper.origin;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.base.BaseMapper;
import org.apache.ibatis.annotations.Param;

public interface GradeMapper extends BaseMapper {

	/**
	 * TODO 查询年级列表
	 * @return
	 * @throws Exception
	 */
	List<Map<String, Object>> loadGradeList() throws Exception;

	/**
	 * TODO 增减年级的班级数
	 * @param gradeValue
	 * @return
	 * @throws Exception
	 */
	Integer increaseClassNum(@Param("gradeValue") String gradeValue) throws Exception;
}