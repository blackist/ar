/**  
* @Title: DictServiceImpl.java <br>
* @Package com.xzit.ar.manage.service.impl <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月25日 下午9:23:53 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.manage.service.dict.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.xzit.ar.common.cache.manage.dict.GetAllDictsCache;
import com.xzit.ar.common.cache.manage.dict.SaveDictCache;
import com.xzit.ar.common.cache.manage.dict.UpdateDictCache;
import com.xzit.ar.common.constant.ServiceConstants;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.dict.DictionaryMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.dict.Dictionary;
import com.xzit.ar.manage.service.dict.DictService;

/**
 * @ClassName: DictServiceImpl <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2015年12月25日 下午9:23:53 <br>
 * @version V1.0 <br>
 */
@Service("dictService")
public class DictServiceImpl implements DictService {

	@Resource
	private DictionaryMapper dictMapper;

	@Override
	public List<Map<String, Object>> queryDicts(Page<Dictionary> page, String queryInput) throws ServiceException {
		List<Map<String, Object>> dictList = new ArrayList<Map<String, Object>>();
		try {
			if (queryInput == null) {
				queryInput = "";
			}
			queryInput = "%" + queryInput + "%";
			dictList = dictMapper.queryDicts(page, queryInput);
		} catch (Exception e) {
			throw new ServiceException(ServiceConstants.SERVICE_EXCEPTION_MSG);
		}
		return dictList;
	}

	@Override
	@SaveDictCache
	public int saveDict(Dictionary dictionary) throws ServiceException {
		int row = 0;
		try {
			row = dictMapper.save(dictionary);
		} catch (Exception e) {
			throw new ServiceException(ServiceConstants.SERVICE_EXCEPTION_MSG);
		}
		return row;
	}

	@Override
	@CacheEvict(value = { "dictionaryCache" }, key = "#dictValue", beforeInvocation = true)
	public int deleteDict(String dictValue) throws ServiceException {
		int row = 0;
		try {
			if (dictValue != null) {
				row = dictMapper.deleteByPrimaryKey(dictValue);
			}
		} catch (Exception e) {
			throw new ServiceException(ServiceConstants.SERVICE_EXCEPTION_MSG);
		}
		return row;
	}

	@Override
	@Cacheable(value = "dictionaryCache", key = "#dictValue")
	public Dictionary getByDictValue(String dictValue) throws ServiceException {
		Dictionary dictionary = null;
		try {
			dictionary = dictMapper.selectByPrimaryKey(dictValue);
			if (dictionary == null) {
				throw new Exception();
			}
		} catch (Exception e) {
			throw new ServiceException("");
		}
		return dictionary;
	}

	@Override
	@UpdateDictCache
	public int updateDict(Dictionary dictionary) throws ServiceException {
		int row = 0;
		try {
			row = dictMapper.update(dictionary);
		} catch (Exception e) {
			throw new ServiceException(ServiceConstants.SERVICE_EXCEPTION_MSG);
		}
		return row;
	}

	@Override
	@GetAllDictsCache
	public List<Dictionary> getAllDicts() throws ServiceException {
		List<Dictionary> dicts = null;
		try {
			dicts = dictMapper.getAll();
		} catch (Exception e) {
			throw new ServiceException(ServiceConstants.SERVICE_EXCEPTION_MSG);
		}
		return dicts;
	}
}
