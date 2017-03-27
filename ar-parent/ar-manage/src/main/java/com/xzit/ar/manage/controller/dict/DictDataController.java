/**  
 * @Title: DictDataController.java
 * @Package com.xzit.ar.manage.controller.dict
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月8日 上午12:33:03
 * @version V1.0  
 */
package com.xzit.ar.manage.controller.dict;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.constant.GlobalConstants;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.dict.Dictionary;
import com.xzit.ar.common.po.dict.DictionaryData;
import com.xzit.ar.manage.service.dict.DictDataService;
import com.xzit.ar.manage.service.dict.DictService;

/**
 * @ClassName: DictDataController
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年1月8日 上午12:33:03
 */
@Controller
@RequestMapping("/dictData")
public class DictDataController extends BaseController {

	@Resource
	private DictDataService dictDataService;

	@Resource
	private DictService dictService;

	/**
	 * @Title: indexDictData @Description: TODO 加载字典数据索引界面 @throws
	 */
	@RequestMapping("/indexDictData")
	public String indexDictData() {
		return "system/dictdata/dictdata-index";
	}

	/**
	 * @throws ServiceException
	 * @Title: queryDictData
	 * @Description: TODO 条件查询字典数据
	 */
	@RequestMapping("/queryDictData")
	public String queryDictData(Model model, String queryInput) throws ServiceException {
		Page<DictionaryData> page = new Page<DictionaryData>(getPageIndex(), getPageSize());
		// 查询记录集合
		dictDataService.queryDictData(page, queryInput);
		// 向前台传递参数
		model.addAttribute("page", page);
		model.addAttribute("queryInput", queryInput);
		setOperateRemarks(model, "字典数据属性值不可修改！" + GlobalConstants.REMARK_BR + "字典数据名可修改");
		return "system/dictdata/dictdata-query";
	}

	/**
	 * @throws ServiceException
	 * @Title: addDictData
	 * @Description: TODO 加载添加数据界面
	 */
	@RequestMapping("/addDictData")
	public String addDictData(Model model) throws ServiceException {
		// 查询所有字典值
		List<Dictionary> dictList = dictService.getAllDicts();
		// 向页面传值
		model.addAttribute("dictList", dictList);
		setOperateRemarks(model, "字典数据属性值设定后不可修改！" + GlobalConstants.REMARK_BR + "字典数据设置固定后不可修改");
		return "system/dictdata/dictdata-add";
	}

	/**
	 * @throws ServiceException
	 * @Title: addDictDataSubmit
	 * @Description: TODO 持久化dictdata数据
	 */
	@RequestMapping("/addDictDataSubmit")
	String addDictDataSubmit(Model model, DictionaryData dictionaryData) throws ServiceException {
		int row = 0;
		// 判断字典数据是否获取到
		if (dictionaryData != null) {
			row = dictDataService.saveDictData(dictionaryData);
		}
		// 处理结果
		if (row > 0) {
			this.setMessage(model, "添加成功");
		} else {
			this.setMessage(model, "添加失败");
		}
		return "forward:queryDictData.action";
	}
}
