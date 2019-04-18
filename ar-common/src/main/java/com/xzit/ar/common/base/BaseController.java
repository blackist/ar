/**
 * @Title: BaseController.java <br>
 * @Package com.xzit.ar.common.base <br>
 * @Description: TODO <br>
 * @author Mr.Black <br>
 * @date 2015年12月21日 上午11:08:45 <br>
 * @version V1.0 <br>
 */
package com.xzit.ar.common.base;

import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.xzit.ar.common.constant.GlobalConstants;
import com.xzit.ar.common.constant.WebConstant;
import com.xzit.ar.common.exception.AssertException;
import com.xzit.ar.common.util.Assert;
import com.xzit.ar.common.util.CommonUtil;

/**
 * @author Mr.Black <br>
 * @version V1.0 <br>
 *          <br>
 * @ClassName: BaseController <br>
 * @Description: TODO <br>
 * @date 2015年12月21日 上午11:08:45 <br>
 */
public abstract class BaseController {

    /**
     * 分页最大数
     */
    private static final int MAX_PAGE_SIZE = 100;

    /**
     * 分页最小数
     */
    private static final int MIN_PAGE_SIZE = 5;

    /**
     * 默认页大小
     */
    private static final int DEFAULT_PAGE_SIZE = 10;

    /**
     * 页面操作备注
     */
    private static String OPERATE_REMARKS = "operateRemarks";

    /**
     * 操作结果信息
     */
    private static String OPERATE_REASULT_MESSAGE = "_message";

    /**
     * 成功跳转页面
     */
    private static String successPage = "error/page500";

    /**
     * 失败跳转页面
     */
    private static String errorPage = "error/page500";

    private static Logger logger = new Logger(BaseController.class);

    /**
     * @param @throws AssertException <br>
     * @return String <br>
     * @throws <br>
     * @Title: getParameter <br>
     * @Description: TODO 获取参数<br>
     * @author Mr.Black <br>
     * @date 2015年12月21日 下午1:28:56 <br>
     */
    protected String getParameter(String param, String errMsg) throws AssertException {
        String value = getRequest().getParameter(param);
        if (errMsg != null) {
            Assert.notEmpty(value, errMsg);
        }
        return StringUtils.trim(value);
    }

    /**
     * @throws <br>
     * @Title: getParameter <br>
     * @Description: TODO 获取参数<br>
     * @author Mr.Black <br>
     * @date 2015年12月21日 下午1:11:27 <br>
     */
    protected String getParameter(String param) {
        String value = getRequest().getParameter(param);
        if (CommonUtil.isNotEmpty(value)) {
            try {
                value = new String(value.getBytes("ISO-8859-1"), GlobalConstants.DEFAULT_CHARSET);
            } catch (UnsupportedEncodingException e) {
                logger.warn(e);
            }
        }
        return StringUtils.trim(value);
    }

    /**
     * @return Long <br>
     * @throws <br>
     * @Title: getLongParameter <br>
     * @Description: TODO getLongParameter<br>
     * @author Mr.Black <br>
     * @date 2015年12月21日 下午1:30:55 <br>
     */
    protected Long getLongParameter(String param, String errMsg) throws AssertException {
        String value = getParameter(param, errMsg);
        return CommonUtil.isEmpty(value) ? null : Long.valueOf(value);
    }

    /**
     * @throws <br>
     * @Title: getLongParameter <br>
     * @Description: TODO getLongParameter<br>
     * @author Mr.Black <br>
     * @date 2015年12月21日 下午1:31:34 <br>
     */
    protected Long getLongParameter(String param) {
        String value = getParameter(param);
        return CommonUtil.isEmpty(value) ? null : Long.valueOf(value);
    }

    /**
     * @return Integer <br>
     * @Description: TODO getIntegerParameter <br>
     * @author Mr.Black <br>
     * @date 2015年12月21日 下午1:32:44 <br>
     */
    protected Integer getIntegerParameter(String param, String errMsg) throws AssertException {
        String value = getParameter(param, errMsg);
        return CommonUtil.isEmpty(value) ? null : Integer.valueOf(value);
    }

    /**
     * @return Integer <br>
     * @Description: TODO getIntegerParameter<br>
     * @author Mr.Black <br>
     * @date 2015年12月21日 下午1:33:23 <br>
     */
    protected Integer getIntegerParameter(String param) {
        String value = getParameter(param);
        return (CommonUtil.isEmpty(value) || value.equals("undefined")) ? null : Integer.valueOf(value);
    }

    /**
     * @Title: getQueryStr
     * @Description: TODO 获取查询条件字符串
     */
    protected String getQueryStr() {
        return this.getParameter("queryStr");
    }

    /**
     * @Title: setQuery
     * @Description: TODO 传递查询条件字符串
     */
    protected void setQuery() {
        this.getRequest().setAttribute("queryStr", this.getParameter("queryStr"));
    }

    /**
     * @Title: getStateStr
     * @Description: TODO 获取查询条件字符串
     */
    protected String getStateStr() {
        if (this.getParameter("stateStr") == null) {
            return "A";
        } else {
            return this.getParameter("stateStr");
        }
    }

    /**
     * @Title: setState
     * @Description: TODO 传递查询条件字符串
     */
    protected void setState() {
        this.getRequest().setAttribute("stateStr", this.getStateStr());
    }

    /**
     * @Title: getSelectStr
     * @Description: TODO 获取条件查询下拉框条件
     */
    protected String getSelectStr() {
        return this.getParameter("selectStr");
    }

    /**
     * @Title: setSelectStr
     * @Description: TODO 返回条件查询下拉框条件
     */
    protected void setSelectStr() {
        this.getRequest().setAttribute("selectStr", this.getParameter("selectStr"));
    }

    /**
     * @param @return <br>
     * @return int <br>
     * @Description: TODO getPageIndex<br>
     * @author Mr.Black <br>
     * @date 2015年12月21日 下午1:34:13 <br>
     */
    protected int getPageIndex() {
        Object temp = getIntegerParameter("pageIndex");
        if (temp == null || temp.equals("undefined")) {
            return 1;
        }
        Integer pageIndex = Integer.parseInt(temp.toString());
        return pageIndex < 1 ? 1 : pageIndex;
    }

    /**
     * @param @return <br>
     * @return int <br>
     * @Description: TODO getPageSize <br>
     * @author Mr.Black <br>
     * @date 2015年12月21日 下午1:34:22 <br>
     */
    protected int getPageSize() {
        Object temp = getIntegerParameter("pageSize");
        if (temp == null || temp.equals("undefined")) {
            return DEFAULT_PAGE_SIZE;
        }
        Integer pageSize = Integer.parseInt(temp.toString());
        return (pageSize < MIN_PAGE_SIZE || pageSize > MAX_PAGE_SIZE) ? DEFAULT_PAGE_SIZE : pageSize;
    }

    /**
     * @return ModelAndView <br>
     * @Description: TODO 页面跳转成功处理<br>
     * @author Mr.Black <br>
     * @date 2015年12月23日 下午9:07:08 <br>
     */
    protected ModelAndView success(String message, String redirectUrl, Map<String, String> param) {
        ModelMap map = new ModelMap();
        map.put("success", true);
        map.put("message", message);
        map.put("url", redirectUrl);
        map.put("paramMap", param);
        return new ModelAndView(successPage, map);
    }

    /**
     * @return ModelAndView <br>
     * @Description: TODO 页面跳转失败处理<br>
     * @author Mr.Black <br>
     * @date 2015年12月23日 下午9:06:44 <br>
     */
    protected ModelAndView fail(String errMessage, String redirectUrl, Map<String, String> param) {
        ModelMap map = new ModelMap();
        map.put("errMsg", errMessage);
        map.put("url", redirectUrl);

        if (param != null) {
            map.put(WebConstant.PAGE_NOT_REDIRECT, param.remove(WebConstant.PAGE_NOT_REDIRECT));
        }
        map.put("paramMap", param);
        return new ModelAndView(errorPage, map);
    }

    /**
     * @param @return <br>
     * @return HttpServletRequest <br>
     * @Description: TODO 获取request<br>
     * @author Mr.Black <br>
     * @date 2015年12月21日 下午1:36:56 <br>
     */
    protected HttpServletRequest getRequest() {
        RequestAttributes requestAttr = RequestContextHolder.getRequestAttributes();
        return ((ServletRequestAttributes) requestAttr).getRequest();
    }

    /**
     * @Title: getSession
     * @Description: TODO 获取当前 Session
     */
    protected HttpSession getSession() {
        return this.getRequest().getSession();
    }

    /**
     * @Title: setOperateRemarks
     * @Description: TODO 通过request设置操作备注
     */
    protected void setOperateRemarks(String operateRemarks) {
        this.getRequest().setAttribute(OPERATE_REMARKS, operateRemarks);
    }

    /**
     * @Description: TODO 添加页面操作说明<br>
     * @author Mr.Black <br>
     * @date 2015年12月26日 上午2:03:44 <br>
     */
    protected void setOperateRemarks(Model model, String operateRemarks) {
        model.addAttribute(OPERATE_REMARKS, operateRemarks);
    }

    /**
     * @Title: setMessage
     * @Description: TODO 处理后存放处理结果信息
     */
    protected void setMessage(String message) {
        this.getRequest().setAttribute("OPERATE_REASULT_MESSAGE", message);
    }

    /**
     * @Description: TODO 向页面返回操作结果信息 <br>
     * message 操作结果信息
     * @author Mr.Black <br>
     * @date 2015年12月27日 下午8:51:09 <br>
     */
    protected void setMessage(Model model, String message) {
        if (model != null) {
            model.addAttribute(OPERATE_REASULT_MESSAGE, message);
        }
    }

    /**
     * @Title: setMessage
     * @Description: TODO 重定向传参数
     */
    protected void setMessage(RedirectAttributes attr, String message) {
        if (attr != null) {
            attr.addAttribute(OPERATE_REASULT_MESSAGE, message);
        }
    }

    /**
     * @Title: getCurrentUser
     * @Description: TODO 获取当前用户
     */
    protected Map<String, Object> getCurrentUser() {
        Map<String, Object> user = null;
        // 普通用户
        user = (Map<String, Object>) getRequest().getSession().getAttribute(WebConstant.SESSION_USER);
        // 管理员用户
        if (CommonUtil.isEmpty(user)) {
            user = (Map<String, Object>) getRequest().getSession().getAttribute(WebConstant.SESSION_ADMIN);
        }
        return user;
    }

    /**
     * @Title: getCurrentUserId
     * @Description: TODO 获取当前用户 ID
     */
    protected Integer getCurrentUserId() {
        Integer userId = null;
        if (CommonUtil.isNotEmpty(this.getCurrentUser())) {
            // 获取当前用户id
            userId = (Integer) this.getCurrentUser().get("userId");
        }
        return userId;
    }

    /**
     * @Title: isCurrentUserAdmin
     * @Description: TODO 判断当前用户是否是管理员
     */
    protected boolean isCurrentUserAdmin() {
        // 获取管理员标识
        String isAdmin = (String) this.getCurrentUser().get("isAdmin");
        if (CommonUtil.isNotEmpty(isAdmin) && isAdmin.equals("1")) {
            return true;
        }
        return false;
    }

    /**
     * @Title: setFormValid
     * @Description: TODO 设置表单校验标识
     */
    protected void setFormValid() {
        // 消除失效校验标识
        this.getSession().setAttribute(WebConstant.FORM_VALID_NAME, null);
        // 生成新标识
        this.getSession().setAttribute(WebConstant.FORM_VALID_NAME, WebConstant.FORM_VALID_NAME);
    }

    /**
     * @Title: validForm
     * @Description: TODO 提交表单后调用此方法，校验是否重复提交
     */
    protected boolean validForm() {
        String _validFlag = (String) getSession().getAttribute(WebConstant.FORM_VALID_NAME);
        // 标识不为空
        if (CommonUtil.isNotEmpty(_validFlag)) {
            // 标识有效
            if (_validFlag.equals(WebConstant.FORM_VALID_NAME)) {
                // 消除失效校验标识
                this.getSession().setAttribute(WebConstant.FORM_VALID_NAME, null);
                return true;
            }
        }
        return false;
    }
}
