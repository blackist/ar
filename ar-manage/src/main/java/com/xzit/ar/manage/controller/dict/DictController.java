/**  
* @Title: DictController.java <br>
* @Package com.xzit.ar.manage.controller.dict <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月25日 下午9:15:37 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.manage.controller.dict;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xzit.ar.common.base.BaseController;
import com.xzit.ar.common.constant.GlobalConstants;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.dict.Dictionary;
import com.xzit.ar.manage.service.dict.DictService;

/**
 * @ClassName: DictController <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2015年12月25日 下午9:15:37 <br>
 * @version V1.0 <br>
 *          <br>
 */
@Controller
@RequestMapping("/dict")
public class DictController extends BaseController {

	@Resource
	private DictService dictService;

	/**
	 * @Description: TODO 加载 dictionary 索引界面<br>
	 * @author Mr.Black <br>
	 * @date 2016年1月3日 下午3:26:04 <br>
	 */
	@RequestMapping("/indexDict")
	public String indexDict(Model model) {
		return "system/dict/dict-index";
	}

	/**
	 * @Description: TODO 根据条件分页查询字典项<br>
	 * @author Mr.Black <br>
	 * @date 2015年12月26日 下午10:57:22 <br>
	 */
	@RequestMapping("/queryDicts")
	public String queryDicts(Model model, String queryInput) throws ServiceException {
		// 分页信息
		Page<Dictionary> page = new Page<Dictionary>(getPageIndex(), getPageSize());
		// 查询记录集合
		dictService.queryDicts(page, queryInput);
		// 向前台传递参数
		model.addAttribute("page", page);
		model.addAttribute("queryInput", queryInput);
		setOperateRemarks(model, "字典属性值不可修改！" + GlobalConstants.REMARK_BR + "字典名可修改");

		return "system/dict/dict-query";
	}

	/**
	 * @Description: TODO 请求添加字典项<br>
	 * @author Mr.Black <br>
	 * @date 2015年12月26日 下午10:55:50 <br>
	 */
	@RequestMapping("/addDict")
	public String addDict(Model model) {
		setOperateRemarks(model, "添加的字典的字典值不能和已有的相同！");
		return "system/dict/dict-add";
	}

	/**
	 * @Description: TODO 保存页面传来的字典项实体<br>
	 * @param @param
	 *            dictionary 字典项实体
	 * @return String <br>
	 * @author Mr.Black <br>
	 * @date 2015年12月26日 下午10:56:21 <br>
	 */
	@RequestMapping("/addDictSubmit")
	public String addDictSubmit(Model model, Dictionary dictionary) throws ServiceException {
		int row = 0;
		row = dictService.saveDict(dictionary);
		if (row > 0) {
			setMessage(model, "添加成功");
		}
		return "forward:queryDicts.action";
	}

	/**
	 * @Description: TODO 根据主键删除字典<br>
	 * @param @param
	 *            dictValue 要删除字典的主键
	 * @author Mr.Black <br>
	 * @date 2015年12月26日 下午10:54:26 <br>
	 */
	@RequestMapping("deleteDict")
	public String deleteDict(Model model, @RequestParam("dictValue") String dictValue) throws ServiceException {
		int row = 0;
		row = dictService.deleteDict(dictValue);
		if (row > 0) {
			setMessage(model, "删除成功");
		}
		return "forward:queryDicts.action";
	}

	/**
	 * @Description: TODO 请求编辑字典<br>
	 * @param @param
	 *            dictValue
	 * @author Mr.Black <br>
	 * @date 2015年12月26日 下午10:53:56 <br>
	 */
	@RequestMapping("/updateDict")
	public String updateDict(Model model, @RequestParam("dictValue") String dictValue) throws ServiceException {

		Dictionary dictionary = dictService.getByDictValue(dictValue);
		model.addAttribute("dictionary", dictionary);
		setOperateRemarks(model, "字典属性值不可修改！" + GlobalConstants.REMARK_BR + "字典名可修改");

		return "system/dict/dict-update";
	}

	/**
	 * @Description: TODO 保存修改的字典项实体<br>
	 * @param @param
	 *            dictionary 字典项实体
	 * @author Mr.Black <br>
	 * @date 2015年12月26日 下午10:57:59 <br>
	 */
	@RequestMapping("/updateDictSubmit")
	public String updateDictSubmit(Model model, Dictionary dictionary) throws ServiceException {

		int row = 0;
		row = dictService.updateDict(dictionary);
		if (row > 0) {
			setMessage(model, "编辑成功");
		}
		return "forward:queryDicts.action";
	}

	@RequestMapping(value = "/getAllDicts", method = RequestMethod.GET)
	public @ResponseBody List<Dictionary> getAllDicts(Model model) throws ServiceException {
		List<Dictionary> dicts = null;
		dicts = dictService.getAllDicts();
		return dicts;
	}
}
