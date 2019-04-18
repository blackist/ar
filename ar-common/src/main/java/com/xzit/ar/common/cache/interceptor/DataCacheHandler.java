/**  
* @Title: CacheHander.java <br>
* @Package com.xzit.ar.common.cache <br>
* @Description: TODO CacheHander<br>
* @author Mr.Black <br>
* @date 2015年12月29日 下午5:51:24 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.cache.interceptor;

import java.io.Serializable;
import java.net.URL;

import org.aspectj.lang.ProceedingJoinPoint;
import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheException;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import net.sf.ehcache.ObjectExistsException;

/**
 * @ClassName: CacheHander <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2015年12月29日 下午5:51:24 <br>
 * @version V1.0 <br>
 *          <br>
 */
public class DataCacheHandler {

	// cacheManager
	private CacheManager cacheManager;
	
	// 缓存变量
	private Cache cache;
	
	// 缓存名称
	private final String cacheName = "DATA_METHOD_CACHE";

	/**
	 * 私有构造方法
	 */
	public DataCacheHandler() {
		try {
			// 1.创建cache manager
			URL url = getClass().getResource("/ehcache.xml");
			System.out.println("encache.xml : url=" + url);

			CacheManager cacheManager = CacheManager.create(url);
			this.cacheManager = cacheManager;
			cache = cacheManager.getCache(cacheName);

			if (cache == null) {
				cache = new Cache("DATA_METHOD_CACHE", 10000, true, false, 600000, 300000);
				cacheManager.addCache(cache);
			}
			System.out.println("cache.getSize()=" + cache.getSize());
			System.out.println("cache object=" + cache);

		} catch (CacheException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @Description: TODO 将查询结果缓存<br>
	 * @author Mr.Black <br>
	 * @date 2015年12月30日 下午1:21:21 <br>
	 */
	@SuppressWarnings("deprecation")
	public Object putResultToCache(ProceedingJoinPoint pjp) throws Throwable {

		// 原实体类名（包括包名）
		String className = pjp.getTarget().getClass().getName();
		// 原方法名
		String methodName = pjp.getSignature().getName();
		// 原方法实参列表
		Object[] arguments = pjp.getArgs();

		if (methodName.startsWith("get") || methodName.startsWith("query") || methodName.startsWith("select")
				|| methodName.startsWith("find")) {
			String cacheKey = getCacheKey(className, methodName, arguments);
			Element element = cache.get(cacheKey);
			if (element == null) {
				// 执行目标方法，并保存目标方法执行后的返回值
				Object resuObject = pjp.proceed();
				element = new Element(cacheKey, (Serializable) resuObject);
				cache.put(element);
				System.out.println("将查询结果放到缓存, key : " + cacheKey);
			} else {
				System.out.println("已经存在, 从缓存中取出 : " + cacheKey);
			}
			return element.getValue();
		}
		return pjp.proceed();
	}

	/**
	 * @Description: TODO 获得cache key的方法，cache key是Cache中一个Element的唯一标识 cache
	 *               key包括
	 *               包名+类名+方法名+各个参数的具体指，如com.co.cache.service.UserServiceImpl.
	 *               getAllUser<br>
	 * @param @param
	 *            targetName 类名
	 * @param @param
	 *            methodName 方法名
	 * @param @param
	 *            arguments 方法实参数组
	 * @param @return
	 *            <br>
	 * @return String <br>
	 * @author Mr.Black <br>
	 * @date 2015年12月30日 下午1:22:11 <br>
	 */
	private String getCacheKey(String targetName, String methodName, Object[] arguments) {
		StringBuffer sb = new StringBuffer();
		sb.append(targetName).append(".").append(methodName);
		if ((arguments != null) && (arguments.length != 0)) {
			for (int i = 0; i < arguments.length; i++) {
				if (arguments[i] instanceof String[]) {
					String[] strArray = (String[]) arguments[i];
					sb.append(".");
					for (String str : strArray) {
						sb.append(str);
					}
				} else {
					sb.append(".").append(arguments[i]);
				}
			}
		}
		return sb.toString();
	}

	public Cache addCache(String cacheName) throws IllegalStateException, ObjectExistsException, CacheException {
		Cache cache = cacheManager.getCache(cacheName);
		if (cache == null) {
			cache = new Cache(cacheName, 10000, true, false, 1000, 100);
			cacheManager.addCache(cache);
		}
		return cache;
	}

	public Cache getCache() {
		return cache;
	}

	public void setCache(Cache cache) {
		this.cache = cache;
	}
}
