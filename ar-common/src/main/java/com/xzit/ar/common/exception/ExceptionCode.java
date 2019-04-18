/**  
* @Title: GlobalExceptionCode.java <br>
* @Package com.xzit.ar.common.exception <br>
* @Description: TODO <br>
* @author Mr.Black <br>
* @date 2015年12月10日 下午7:38:39 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.exception;

/**
 * @ClassName: GlobalExceptionCode <br>
 * @Description: TODO 异常错误code代码 <br>
 * @author Mr.Black <br>
 * @date 2015年12月10日 下午7:38:39 <br>
 * @version V1.0 <br>
 *          <br>
 */
public interface ExceptionCode {

	/************************************************************************************
	 * ---------------------------------请求成功区域
	 * 必须小于10000-------------------------------------------
	 ************************************************************************************/

	/** 成功 */
	int SUCCESS = 0;

	/************************************************************************************
	 * ---------------------------------系统错误区域
	 * 必须以1开头的5位数-------------------------------------------
	 ************************************************************************************/

	/** 系统错误 */
	int SYSTEM_ERROR_10001 = 10001;

	/** 缓存失败 */
	int CACHE_ERROR_10002 = 10002;

	/** 不包含局部变量表信息，请使用编译器选项 javac -g */
	int CAN_NOT_FIND_VER_NAME_10003 = 10003;

	/** 初始化SQL失败 */
	int INIT_SQL_ERROR_10005 = 10005;

	/** 找不到SQL文件 */
	int CAN_NOT_FIND_SQL_FILE_10006 = 10006;

	/** 查询失败 */
	int QUERY_ERROR_10010 = 10010;

	/** 执行sql失败 */
	int EXECUTE_ERROR_10011 = 10011;

	/** 批量失败 */
	int BATCH_EXECUTE_ERROR_10012 = 10012;

	/** 保存失败 */
	int SAVE_ERROR_10013 = 10013;

	/** 根据ID查询失败 */
	int GET_BY_ID_ERROR_10014 = 10014;

	/** 根据Bean查询失败 */
	int GET_BY_ENTITY_ERROR_10015 = 10015;

	/** 更新失败 */
	int UPDATE_ERROR_10016 = 10016;

	/** 删除失败 */
	int DELETE_ERROR_10017 = 10017;

	/** deleteById */
	int DELETE_BY_ID_ERROR_10018 = 10018;

	/** 查询一个集合 */
	int SELECT_LIST_ERROR_10019 = 10019;

	/** 缩放图片失败 */
	int IMAGE_ZOOM_10020 = 10020;

	/** 执行任务失败 */
	int SCHEDULE_TASK_ERROR_10021 = 10021;

	/** 暂停任务失败 */
	int PAUSE_TASK_ERROR_10022 = 10022;

	/** 恢复任务失败 */
	int RESUME_TASK_ERROR_10023 = 10023;

	/** 删除任务失败 */
	int REMOVE_TASK_ERROR_10024 = 10024;

	/** 菜单数据有问题 */
	int MENU_DATA_ERROR_10025 = 10025;

	/** 下载资源失败 */
	int DOWN_LOAD_RESOURCE_ERROR_10026 = 10026;

	/** 读取内容体失败 */
	int READ_PARAM_ERROR_10027 = 10027;
	
	int READ_FILE_ERROR_10028 = 10028;

	/** 写文件失败 */
	int WRITE_FILE_ERROR_10029 = 10029;

	/** 栈溢出异常，启动失败 */
	int STACK_OVERFLOW_ERROR_10030 = 10030;

	/** 不支持的API类型 */
	int UNSUPPORT_API_10031 = 10031;

	/** 邮件发送失败 */
	int EMAIL_SEND_ERROR_10032 = 10032;

	/** 短信发送失败 */
	int SMS_SEND_ERROR_10033 = 10033;

	/** http请求错误 */
	int HTTP_REQUEST_ERROR_10035 = 10035;

	/** MD5 ERROR */
	int MD5_ERROR_10036 = 10036;

	/** base64 */
	int BASE64_ERROR_10037 = 10037;

	/** 个推推送失败 */
	int GE_TUI_ERROR_10038 = 10038;

	/** 区域缓存失败 */
	int AREA_INITIAL_ERROR_10039 = 10039;

	/** 请使用包装类型的数组 */
	int LIST_PARAM_ERROR_10040 = 10040;

	/** 资源文件不存在 */
	int RESOUCE_NOT_EXIST_ERROR_10041 = 10041;

	/** 执行JS脚本错误 */
	int EVAL_JAVASCRIPT_ERROR_10042 = 10042;

	/** 执行所有任务失败 */
	int EXECUTE_ALL_TAKS_ERROR = 10043;

	/************************************************************************************
	 * ---------------------------------用户错误区域
	 * 必须大于20000的5位数-------------------------------------------
	 ************************************************************************************/

	/** access token 过期 */
	int ACCESS_TOKEN_EXPIRED_20001 = 20001;

	/** 用户名或密码错误 */
	int USER_NAME_OR_PASSWORD_ERROR_20002 = 20002;

	/** 账号已经存在 */
	int ACCOUNT_EXSIST_20004 = 20004;

	/** 不能为空 */
	int NOT_NULL_20005 = 20005;

	/** 必须为空 */
	int IS_NULL_20006 = 20006;

	/** 操作员不存在 */
	int OPERATOR_NOT_EXSIST_20007 = 20007;

	/** 账号已锁定 */
	int ACCOUNT_IS_LOCK_20008 = 20008;

	/** 状态错误 */
	int STATE_ERROR_20009 = 20009;

	/** 不支持的媒体类型 */
	int UNSPORT_MEDIA_TYPE_20010 = 20010;

	/** 文件大小超限 */
	int FILE_IS_TO_LARGER_20011 = 20011;

	/** 文件类型不支持 */
	int UNSPORT_CONTENT_TYPE_20012 = 20012;

	/** 文件未找到 */
	int FILE_NOT_FIND_20013 = 20013;

	/** 第三方帐号不支持修改密码 */
	int UNSPORT_UPDATE_PASSWORD_20014 = 20014;

	/** 新老密码不能一致 */
	int NEW_PASSWORD_ERROR_20015 = 20015;

	/** 渠道不存在 */
	int CONTACT_CHANNEL_NOT_EXIST_20016 = 20016;

	/** 生成上传token失败 */
	int QI_NIU_UP_TOKEN_ERROR_20018 = 20018;

	/** 密码和验证码不能同时为空 */
	int VERIFY_CODE_IS_NULL_20019 = 20019;

	/** 不支持的日志类型 */
	int UNSPORT_LOGGER_TYPE = 20020;

	/** 保存任务失败 */
	int SAVE_TASK_OR_TASK_TRIGGER_ERROR = 20021;

	/** 验证码错误 */
	int VERIFY_CODE_ERROR = 20025;

	/** 保存TASK历史记录失败 */
	int SAVE_HIS_ERROR_20026 = 20026;

	/** 删除TASK相关信息失败 */
	int DEL_TASK_ERROR_20027 = 20027;
}
