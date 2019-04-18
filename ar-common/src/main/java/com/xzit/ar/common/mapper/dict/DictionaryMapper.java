package com.xzit.ar.common.mapper.dict;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.dict.Dictionary;

public interface DictionaryMapper extends BaseMapper {
	int deleteByPrimaryKey(@Param("dictValue") String dictValue) throws Exception;

	Dictionary selectByPrimaryKey(@Param("dictValue") String dictValue) throws Exception;

	List<Map<String, Object>> queryDicts(Page<Dictionary> page, @Param("queryInput") String queryInput) throws Exception;
	
	
}