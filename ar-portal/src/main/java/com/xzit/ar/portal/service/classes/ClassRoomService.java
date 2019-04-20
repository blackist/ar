/**  
 * @Title: ClassRoomService.java
 * @Package com.xzit.ar.portal.service.origin
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月20日 下午4:15:39
 * @version V1.0  
 */
package com.xzit.ar.portal.service.classes;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Comment;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.po.origin.Origin;
import com.xzit.ar.common.po.user.UserOrigin;

/**
 * @ClassName: ClassRoomService
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月20日 下午4:15:39
 */
public interface ClassRoomService {

	/**
	 * TODO 查询班级基本信息
	 * @param classId
	 * @return
	 * @throws ServiceException
	 */
	Map<String, Object> classIndex(Integer classId) throws ServiceException;

	Page<Map<String, Object>> classDirector(Page<Map<String, Object>> page, Integer classId)
			throws ServiceException;

	Page<Map<String, Object>> classMember(Page<Map<String, Object>> page, Integer classId)
			throws ServiceException;
	/**
	 * TODO 加载班级最新动态消息
	 * @param page
	 * @param classId
	 * @return
	 * @throws ServiceException
	 */
	Page<Map<String, Object>> classInfo(Page<Map<String, Object>> page, Integer classId) throws ServiceException;

	List<Map<String, Object>> classInfoComment(Integer infoId) throws ServiceException;

	Map<String, Object> classInfoDetail(Integer classId, Integer infoId) throws ServiceException;

	List<Map<String, Object>> classOtherInfo(Integer classId, Integer infoNum) throws ServiceException;

	List<Map<String, Object>> classMateInfos(Page<Map<String, Object>> page, Integer classId, Integer userId) throws ServiceException;

	Integer addClassInfoComment(Comment comment) throws ServiceException;

	Integer addClassInfo(Information information) throws ServiceException;

	boolean isMemberInClass(Integer userId, Integer classId) throws ServiceException;

	Integer addToClass(UserOrigin userOrigin) throws ServiceException;

	List<Integer> getAllMemberIds(Integer classId) throws ServiceException;

	Page<Map<String, Object>> classMessage(Page<Map<String, Object>> page, Integer classId)
			throws ServiceException;

	Integer updateClassDesc(String description, Integer classId) throws ServiceException;

}
