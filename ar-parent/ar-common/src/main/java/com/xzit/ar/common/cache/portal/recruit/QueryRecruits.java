/**  
 * @Title: QueryRecruits.java
 * @Package com.xzit.ar.common.cache.portal.recruit
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月26日 下午11:30:34
 * @version V1.0  
 */
package com.xzit.ar.common.cache.portal.recruit;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.cache.annotation.Cacheable;

/**
 * @ClassName: QueryRecruits
 * @Description: TODO QueryRecruits
 * @author Mr.Black
 * @date 2016年1月26日 下午11:30:34
 */
@Cacheable(value="recruitCache")
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface QueryRecruits {

}
