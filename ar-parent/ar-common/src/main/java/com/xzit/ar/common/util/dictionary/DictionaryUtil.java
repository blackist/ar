/**  
 * @Title: DictionaryUtil.java
 * @Package com.xzit.ar.common.util.dictionary
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月9日 上午2:35:31
 * @version V1.0  
 */
package com.xzit.ar.common.util.dictionary;

import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.mapper.dict.DictionaryDataMapper;

/**
 * @ClassName: DictionaryUtil
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月9日 上午2:35:31
 */
public class DictionaryUtil {

	public static void loadDictionary() throws UtilException {
		System.out.println("-------------------- 加载数据字典 --------------------");
		try {
			DictionaryDataMapper dictionaryDataMapper = ARContext.applicationContext
					.getBean(DictionaryDataMapper.class);
			// 所有字典数据
			ARContext.dictionary = dictionaryDataMapper.findAll();
			// dictionary 放入Context
			ARContext.context.setAttribute("dictionary", ARContext.dictionary);
		} catch (Exception e) {
			throw new UtilException("加载数据字典失败!");
		}
	}
}
