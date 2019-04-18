/**  
* @Title: CacheInterceptor.java <br>
* @Package com.xzit.ar.common.cache <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月29日 下午5:54:42 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.cache.interceptor;

import org.aspectj.lang.ProceedingJoinPoint;

/**
 * @ClassName: CacheInterceptor <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2015年12月29日 下午5:54:42 <br>
 * @version V1.0 <br>
 *          <br>
 */
public class DataCache {
	private DataCacheHandler dataCacheHandler;

	public void cacheData(ProceedingJoinPoint pjp) throws Throwable {

		System.out.println("执行拦截器的processCache()方法----------开始");
		dataCacheHandler.putResultToCache(pjp);
		System.out.println("执行拦截器的processCache()方法----------结束");

	}
}
