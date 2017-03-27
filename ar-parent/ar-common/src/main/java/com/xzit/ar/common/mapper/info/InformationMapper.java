package com.xzit.ar.common.mapper.info;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;

public interface InformationMapper extends BaseMapper {

	List<Map<String, Object>> loadOriginInfos(@Param("infoType") String infoType, @Param("originId") Integer originId,
			@Param("infoNum") Integer infoNum);

	List<Map<String, Object>> loadOriginUserInfos(Page<Map<String, Object>> page, @Param("userId") Integer userId,
			@Param("originId") Integer originId, @Param("infoType") String infoType);

	Integer increaseCommentNum(@Param("infoId") Integer infoId);
}