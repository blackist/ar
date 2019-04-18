package com.xzit.ar.common.mapper.dict;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.dict.DictionaryData;

public interface DictionaryDataMapper extends BaseMapper{
	int deleteByPrimaryKey(Integer id);

	DictionaryData selectByPrimaryKey(Integer id);

	List<Map<String, Object>> queryDictData(Page<DictionaryData> page, @Param("queryInput") String queryInput)
			throws Exception;
	
	List<Map<String, Object>> findAll() throws Exception;
	
	List<Map<String, Object>> loadDictData(@Param("dict") String dict) throws Exception;
}