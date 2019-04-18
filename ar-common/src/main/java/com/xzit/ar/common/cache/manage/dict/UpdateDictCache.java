/**  
* @Title: UpdateDictCache.java <br>
* @Package com.xzit.ar.common.cache.dict <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月1日 下午9:10:25 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.cache.manage.dict;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Caching;

/**
 * @ClassName: UpdateDictCache <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2016年1月1日 下午9:10:25 <br>
 * @version V1.0 <br>
 */
@Caching(evict = { @CacheEvict(value = "dictionaryCache", key = "#dictionary.dictValue", beforeInvocation = true),
		@CacheEvict(value = { "dictionaryCache" }, key = "#root.caches[0].name", beforeInvocation = true) })
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface UpdateDictCache {

}
