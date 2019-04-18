/**  
* @Title: SaveDictCache.java <br>
* @Package com.xzit.ar.common.cache.dict <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2016年1月1日 下午8:38:01 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.cache.manage.dict;

import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.ElementType;

import org.springframework.cache.annotation.CacheEvict;

/**
 * @ClassName: SaveDictCache <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2016年1月1日 下午8:38:01 <br>
 * @version V1.0 <br>
 */
@CacheEvict(value = "dictionaryCache", beforeInvocation = true, key = "#root.caches[0].name")
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface SaveDictCache {

}
