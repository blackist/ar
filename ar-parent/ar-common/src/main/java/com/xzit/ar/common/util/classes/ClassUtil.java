/**  
 * @Title: ClassUtil.java
 * @Package com.xzit.ar.common.util.classes
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月18日 下午8:59:36
 * @version V1.0  
 */
package com.xzit.ar.common.util.classes;

import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.init.context.ARContext;
import com.xzit.ar.common.mapper.origin.GradeMapper;

/**
 * @ClassName: ClassUtil
 * @Description: TODO 班级录变量的处理
 * @author Mr.Black
 * @date 2016年2月18日 下午8:59:36
 */
public class ClassUtil {

	/**
	 * @throws UtilException
	 * @Title: initClass
	 * @Description: TODO 班级录初始化
	 */
	public static void initClass() throws UtilException {
		loadGradeList();
	}

	/**
	 * @throws Exception
	 * @Title: loadGrade
	 * @Description: TODO 加载年级列表
	 */
	public static void loadGradeList() throws UtilException {
		try {
			ARContext.classGrade = ARContext.applicationContext.getBean(GradeMapper.class).loadGradeList();
		} catch (Exception e) {
			throw new UtilException("加载年级列表异常");
		}
	}

	/**
	 * @Title: refreshGradeList
	 * @Description: TODO 刷新年级列表
	 */
	public static void refreshGradeList() throws UtilException {
		try {
			ARContext.classGrade = ARContext.applicationContext.getBean(GradeMapper.class).loadGradeList();
		} catch (Exception e) {
			throw new UtilException("刷新年级列表异常");
		}
	}

}
