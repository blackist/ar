/**  
 * @Title: RecruitUtil.java
 * @Package com.xzit.ar.common.util.recruit
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月3日 下午9:47:13
 * @version V1.0  
 */
package com.xzit.ar.common.util.recruit;

import com.xzit.ar.common.exception.UtilException;
import com.xzit.ar.common.init.context.ARContext;

/**
 * @ClassName: RecruitUtil
 * @Description: TODO 职业招聘相关工具
 * @author Mr.Black
 * @date 2016年2月3日 下午9:47:13
 */
public class RecruitUtil {

	public static void initRecruit() throws UtilException {
		System.out.println(">>>>>>>>>>>>>>>>>>>>> 职业招聘初始化 <<<<<<<<<<<<<<<<<<<<<<");
		loadUnitProperty();
		loadUnitIndustry();
		loadUnitScale();
		loadPositionSalary();
		loadPositionBenefit();
		loadPositionProf();
	}

	/**
	 * @throws UtilException
	 * @Title: loadUnitProperty
	 * @Description: TODO 加载公司属性列表
	 */
	public static void loadUnitProperty() throws UtilException {
		System.out.println("-------------------- 加载 公司属性列表 --------------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.unitProperty = ARContext.dataMapper.loadDictData("pro");
		} catch (Exception e) {
			throw new UtilException("加载公司属性列表失败！");
		}
	}

	/**
	 * @Title: refreshUnitProperty
	 * @Description: TODO 刷新
	 */
	public static void refreshUnitProperty() throws UtilException {
		System.out.println("-------------- 刷新 公司属性列表 ---------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.unitProperty = ARContext.dataMapper.loadDictData("pro");
		} catch (Exception e) {
			throw new UtilException("刷新公司属性列表失败！");
		}
	}

	/**
	 * @Title: loadUnitScale
	 * @Description: TODO loadUnitScale
	 */
	public static void loadUnitScale() throws UtilException {
		System.out.println("-------------------- 加载 公司规模列表 --------------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.unitScale = ARContext.dataMapper.loadDictData("sca");
		} catch (Exception e) {
			throw new UtilException("加载公司规模列表失败！");
		}
	}

	/**
	 * @Title: refreshUnitScale
	 * @Description: TODO refreshUnitScale
	 */
	public static void refreshUnitScale() throws UtilException {
		System.out.println("-------------- 刷新 公司规模列表 ---------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.unitScale = ARContext.dataMapper.loadDictData("sca");
		} catch (Exception e) {
			throw new UtilException("刷新公司规模列表失败！");
		}
	}

	/**
	 * @Title: loadUnitIndustry
	 * @Description: TODO loadUnitIndustry
	 */
	public static void loadUnitIndustry() throws UtilException {
		System.out.println("-------------------- 加载 公司行业列表 --------------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.unitIndustry = ARContext.dataMapper.loadDictData("ind");
		} catch (Exception e) {
			throw new UtilException("加载公司行业列表失败！");
		}
	}

	/**
	 * @Title: refreshUnitIndustry
	 * @Description: TODO refreshUnitIndustry
	 */
	public static void refreshUnitIndustry() throws UtilException {
		System.out.println("-------------- 刷新 公司行业列表 ---------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.unitIndustry = ARContext.dataMapper.loadDictData("ind");
		} catch (Exception e) {
			throw new UtilException("刷新 公司行业列表失败！");
		}
	}

	/**
	 * @Title: loadPositionBenefit @Description: TODO @param @throws
	 *         UtilException @return void @throws
	 */
	public static void loadPositionSalary() throws UtilException {
		System.out.println("-------------------- 加载 职位薪资列表 --------------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.positionSalary = ARContext.dataMapper.loadDictData("sl");
		} catch (Exception e) {
			throw new UtilException("加载职位薪资列表失败！");
		}
	}

	/**
	 * @Title: refreshPositionBenefit @Description: TODO @param @throws
	 *         UtilException @return void @throws
	 */
	public static void refreshPositionSalary() throws UtilException {
		System.out.println("-------------- 刷新 职位薪资列表 ---------------");
		try {
			ARContext.positionSalary = ARContext.dataMapper.loadDictData("sl");
		} catch (Exception e) {
			throw new UtilException("刷新职位薪资列表失败！");
		}
	}

	/**
	 * @Title: loadPositionBenefit @Description: TODO @param @throws
	 *         UtilException @return void @throws
	 */
	public static void loadPositionBenefit() throws UtilException {
		System.out.println("-------------------- 加载 职位福利列表 --------------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.positionBenefit = ARContext.dataMapper.loadDictData("be");
		} catch (Exception e) {
			throw new UtilException("加载职位福利列表失败！");
		}
	}

	/**
	 * @Title: refreshPositionBenefit @Description: TODO @param @throws
	 *         UtilException @return void @throws
	 */
	public static void refreshPositionBenefit() throws UtilException {
		System.out.println("-------------- 刷新 职位福利列表 ---------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.positionBenefit = ARContext.dataMapper.loadDictData("be");
		} catch (Exception e) {
			throw new UtilException("刷新职位福利列表失败！");
		}
	}

	/**
	 * @Title: loadPositionPro
	 * @Description: TODO loadPositionPro
	 */
	public static void loadPositionProf() throws UtilException {
		System.out.println("-------------------- 加载 职位学历要求列表 --------------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.positionProf = ARContext.dataMapper.loadDictData("prof");
		} catch (Exception e) {
			throw new UtilException("加载职位学历要求列表失败！");
		}
	}

	public static void refreshPositionProf() throws UtilException {
		System.out.println("-------------- 刷新 职位学历要求列表 ---------------");
		try {
			// 加载数据库存有权限到环境
			ARContext.positionProf = ARContext.dataMapper.loadDictData("prof");
		} catch (Exception e) {
			throw new UtilException("刷新 职位学历要求列表失败！");
		}
	}
}
