/**  
 * @Title: ARContext.java
 * @Package com.xzit.ar.common.init.context
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月3日 下午9:56:34
 * @version V1.0  
 */
package com.xzit.ar.common.init.context;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;

import com.xzit.ar.common.mapper.dict.DictionaryDataMapper;
import com.xzit.ar.common.po.role.Right;

/**
 * @ClassName: ARContext
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月3日 下午9:56:34
 */
public class ARContext {
	
	/****************************************** mapper对象 *****************************************/
	/**
	 * 数据字典Mapper对象
	 */
	public static DictionaryDataMapper dataMapper;
	
	
	/****************************************** Context环境变量 ******************************************/
	/**
	 * context
	 */
	public static ServletContext context;

	/**
	 * applicationContext
	 */
	public static ApplicationContext applicationContext;
	
	/**
	 * 字母表
	 */
	public static String[] lowerLetters = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r",
			"s", "t", "u", "v", "w", "x", "y", "z" };

	/**
	 * 数据字典
	 */
	public static List<Map<String, Object>> dictionary;

	/**
	 * 权限资源
	 */
	public static List<Right> rightList;

	/**
	 * 职业招聘环境变量
	 */

	public static List<Map<String, Object>> positionSalary;
	
	public static List<Map<String, Object>> positionBenefit;
	
	public static List<Map<String, Object>> positionProf;

	public static List<Map<String, Object>> unitProperty;

	public static List<Map<String, Object>> unitScale;

	public static List<Map<String, Object>> unitIndustry;
	
	/**
	 * 组织环境变量
	 */
	
	public static List<Map<String, Object>> originGrade;

	public static List<Map<String, Object>> originType;

	/**
	 * 信息环境变量
	 */
	public static List<Map<String, Object>> infoTheme;

	public static List<Map<String, Object>> infoType;


}
