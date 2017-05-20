/**  
 * @Title: ClassRoomServiceImpl.java
 * @Package com.xzit.ar.portal.service.origin.impl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月20日 下午4:17:11
 * @version V1.0  
 */
package com.xzit.ar.portal.service.classes.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.xzit.ar.common.po.origin.Origin;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.info.CommentMapper;
import com.xzit.ar.common.mapper.info.InformationMapper;
import com.xzit.ar.common.mapper.origin.ClassRoomMapper;
import com.xzit.ar.common.mapper.origin.OriginMapper;
import com.xzit.ar.common.mapper.user.UserOriginMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Comment;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.po.user.UserOrigin;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.classes.ClassRoomService;

/**
 * @ClassName: ClassRoomServiceImpl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月20日 下午4:17:11
 */
@Service("classRoomService")
public class ClassRoomServiceImpl implements ClassRoomService {

	@Resource
	private ClassRoomMapper classRoomMapper;

	@Resource
	private InformationMapper infoMapper;

	@Resource
	private CommentMapper commentMapper;

	@Resource
	private UserOriginMapper userOriginMapper;

	@Resource
	private OriginMapper originMapper;

	@Override
//	@Cacheable(value = { "classroomCache" })
	public Map<String, Object> classIndex(Integer classId) throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(classId)) {
				return classRoomMapper.classIndex(classId);
			}
		} catch (Exception e) {
			throw new ServiceException("加载班级信息时发生错误！");
		}
		return null;
	}

	@Override
//	@Cacheable(value = { "classroomCache" })
	public Page<Map<String, Object>> classDirector(Page<Map<String, Object>> page, Integer classId)
			throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(classId)) {
				classRoomMapper.classDirectory(page, classId);
				return page;
			}
		} catch (Exception e) {
			throw new ServiceException("加载班级通讯录时发生错误!");
		}
		return null;
	}

	@Override
//	@Cacheable(value = { "classroomCache" })
	public Page<Map<String, Object>> classMember(Page<Map<String, Object>> page, Integer classId)
			throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(classId)) {
				classRoomMapper.classMember(page, classId);
				return page;
			}
		} catch (Exception e) {
			throw new ServiceException("加载班级成员时发生错误!");
		}
		return null;
	}

	@Override
//	@Cacheable(value = { "classroomCache" })
	public Page<Map<String, Object>> classInfo(Page<Map<String, Object>> page, Integer classId)
			throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(classId)) {
				classRoomMapper.classInfo(page, classId);
				return page;
			}
		} catch (Exception e) {
			throw new ServiceException("加载班级成员时发生错误!");
		}
		return null;
	}

	@Override
//	@Cacheable(value = { "classroomCache" })
	public Map<String, Object> classInfoDetail(Integer classId, Integer infoId) throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(classId) && CommonUtil.isNotEmpty(infoId)) {
				infoMapper.increaseViews(infoId);
				return classRoomMapper.classInfoDetail(classId, infoId);
			}
		} catch (Exception e) {
			throw new ServiceException("加载班级动态时发生错误!");
		}
		return null;
	}

	@Override
//	@Cacheable(value = { "classroomCache" })
	public List<Map<String, Object>> classOtherInfo(Integer classId, Integer infoNum) throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(classId) && CommonUtil.isNotEmpty(infoNum)) {
				return infoMapper.loadOriginInfos("CI", classId, infoNum);
			}
		} catch (Exception e) {
			throw new ServiceException("加载班级动态时发生错误!");
		}
		return null;
	}

	@Override
//	@Cacheable(value = { "classroomCache" })
	public List<Map<String, Object>> classMateInfos(Page<Map<String, Object>> page, Integer classId, Integer userId)
			throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(classId) && CommonUtil.isNotEmpty(userId)) {
				return infoMapper.loadOriginUserInfos(page, userId, classId, "CI");
			}
		} catch (Exception e) {
			throw new ServiceException("加载班级动态时发生错误!");
		}
		return null;
	}

	@Override
//	@Cacheable(value = { "classroomCache" })
	public List<Map<String, Object>> classInfoComment(Integer infoId) throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(infoId)) {
				return commentMapper.loadInfoComment(infoId);
			}
		} catch (Exception e) {
			throw new ServiceException("加载班级动态时发生错误!");
		}
		return null;
	}

	@Override
//	@CacheEvict(value = "classroomCache", allEntries = true, beforeInvocation = true)
	public Integer addClassInfoComment(Comment comment) throws ServiceException {
		try {
			// 参数校验
			if (comment != null && CommonUtil.isNotEmpty(comment.getContent())
					&& CommonUtil.isNotEmpty(comment.getInfoId())) {
				// 动态的评论数+1
				infoMapper.increaseComments(comment.getInfoId());
				// 保存评论
				return commentMapper.save(comment);
			}
		} catch (Exception e) {
			throw new ServiceException("发表评论时发生错误!");
		}
		return null;
	}

	@Override
//	@CacheEvict(value = "classroomCache", allEntries = true, beforeInvocation = true)
	public Integer addClassInfo(Information information) throws ServiceException {
		try {
			// 参数校验
			if (information != null && CommonUtil.isNotEmpty(information.getContent())) {
				return infoMapper.save(information);
			}
		} catch (Exception e) {
			throw new ServiceException("发布动态时发生错误!");
		}
		return null;
	}

	@Override
//	@CacheEvict(value = "classroomCache", allEntries = true, beforeInvocation = true)
	public Integer addToClass(UserOrigin userOrigin) throws ServiceException {
		try {
			// 参数校验
			if (userOrigin != null && CommonUtil.isNotEmpty(userOrigin.getUserId())
					&& CommonUtil.isNotEmpty(userOrigin.getOriginId())) {
				originMapper.addOriginMemberNum(userOrigin.getOriginId());
				return (Integer)userOriginMapper.save(userOrigin);
			}
		} catch (Exception e) {
			throw new ServiceException("加入班级时发生错误!");
		}
		return null;
	}

	@Override
//	@Cacheable(value = { "classroomCache" })
	public List<Integer> getAllMemberIds(Integer classId) throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(classId)) {
				return userOriginMapper.getAllOriginMemberIds(classId);
			}
		} catch (Exception e) {
			throw new ServiceException("加载班级信息时发生错误!");
		}
		return null;
	}

	@Override
//	@Cacheable(value = { "classroomCache" })
	public Page<Map<String, Object>> classMessage(Page<Map<String, Object>> page, Integer classId)
			throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(classId)) {
				classRoomMapper.classMessage(page, classId);
				return page;
			}
		} catch (Exception e) {
			throw new ServiceException("加载班级留言时发生错误!");
		}
		return null;
	}

	@Override
//	@CacheEvict(value = "classroomCache", allEntries = true, beforeInvocation = true)
	public Integer updateClassDesc(String description, Integer classId) throws ServiceException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(classId) && CommonUtil.isNotEmpty(description)) {
				return originMapper.updateOriginDesc(classId, description);
			}
		} catch (Exception e) {
			throw new ServiceException("设置班级简介时发生错误!");
		}
		return null;
	}

	@Override
	public boolean isMemberInClass(Integer userId, Integer classId) throws ServiceException {
		try {
			// 查询user是否已经与class关联
			if (userOriginMapper.isMemberInOrigin(classId, userId) > 0) {
				return true;
			}
		} catch (Exception e) {
			throw new ServiceException("加入班级时发生错误！");
		}
		return false;
	}

}
