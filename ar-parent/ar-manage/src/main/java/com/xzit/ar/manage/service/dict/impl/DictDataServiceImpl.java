/**  
 * @Title: DictDataServiceImpl.java
 * @Package com.xzit.ar.manage.service.dict.impl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月8日 上午12:38:25
 * @version V1.0  
 */
package com.xzit.ar.manage.service.dict.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.ar.common.constant.ServiceConstants;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.dict.DictionaryDataMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.dict.DictionaryData;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.manage.service.dict.DictDataService;

/**
 * @ClassName: DictDataServiceImpl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月8日 上午12:38:25
 */
@Service("dictDataService")
public class DictDataServiceImpl implements DictDataService {

	@Resource
	private DictionaryDataMapper dictionaryDataMapper;

	@Override
	public List<Map<String, Object>> queryDictData(Page<DictionaryData> page, String queryInput)
			throws ServiceException {
		List<Map<String, Object>> dictDataList = null;
		try {
			if (queryInput == null) {
				queryInput = "";
			}
			queryInput = "%" + queryInput + "%";
			dictDataList = dictionaryDataMapper.queryDictData(page, queryInput);
		} catch (Exception e) {
			throw new ServiceException(ServiceConstants.SERVICE_EXCEPTION_MSG);
		}

		return dictDataList;
	}

	@Override
	public int saveDictData(DictionaryData dictionaryData) throws ServiceException {
		int row = 0;
		try {
			// dictValue dictdataValue 都不能为空
			if (CommonUtil.isNotEmpty(dictionaryData.getDictdataValue())
					&& CommonUtil.isNotEmpty(dictionaryData.getDictValue())) {
				row = dictionaryDataMapper.save(dictionaryData);
			} else {
				throw new ServiceException("操作错误！");
			}
		} catch (Exception e) {
			throw new ServiceException("系统错误！");
		}

		return row;
	}

}
