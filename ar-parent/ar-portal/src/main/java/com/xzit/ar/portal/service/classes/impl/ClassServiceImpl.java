/**
 * @Title: ClassServiceImpl.java
 * @Package com.xzit.ar.portal.service.origin.impl
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月18日 下午1:03:36
 * @version V1.0
 */
package com.xzit.ar.portal.service.classes.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.origin.GradeMapper;
import com.xzit.ar.common.mapper.origin.OriginMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.origin.Grade;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.classes.ClassService;

/**
 * @author Mr.Black
 * @ClassName: ClassServiceImpl
 * @Description: TODO ClassService实现类
 * @date 2016年2月18日 下午1:03:36
 */
@Service("classService")
public class ClassServiceImpl implements ClassService {

    @Resource
    private GradeMapper gradeMapper;

    @Resource
    private OriginMapper classMapper;

    @Override
    public List<Grade> getAll() throws ServiceException {
        try {
            return gradeMapper.getAll();
        } catch (Exception e) {
            throw new ServiceException("");
        }
    }

    @Override
    public List<Map<String, Object>> queryClasses(Page<Map<String, Object>> page, String queryStr, String selectStr)
            throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isEmpty(queryStr)) {
                queryStr = "";
            }
            if (CommonUtil.isEmpty(selectStr)) {
                selectStr = "";
            }
            queryStr = "%" + queryStr + "%";
            selectStr = "%" + selectStr + "%";
            // 查询
            return classMapper.queryClasses(page, queryStr, selectStr, "A");
        } catch (Exception e) {
            throw new ServiceException("班级录异常");
        }
    }

    @Override
    public Integer countClassNum() throws ServiceException {
        try {
            return classMapper.countOriginNumByType("C");
        } catch (Exception e) {
            throw new ServiceException("班级录信息异常");
        }
    }

    @Override
    public Integer countClassMembers() throws ServiceException {
        try {
            return classMapper.countOriginMembersByType("C");
        } catch (Exception e) {
            throw new ServiceException("班级录信息异常");
        }
    }

    @Override
    public List<Map<String, Object>> loadMyClass(Integer userId) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(userId)) {
                return classMapper.loadMyOrigin("C", userId);
            }
        } catch (Exception e) {
            throw new ServiceException("为您加载班级时发生异常!");
        }
        return null;
    }

    @Override
    public List<Map<String, Object>> loadPopularClass(Integer number) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(number)) {
                return classMapper.loadPopularOrigin("C", number);
            }
        } catch (Exception e) {
            throw new ServiceException("加载人气班级时发生异常!");
        }
        return null;
    }

    @Override
    public List<Map<String, Object>> latestMembers(Integer number) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(number)) {
                return classMapper.latestMembers("C", number);
            }
        } catch (Exception e) {
            throw new ServiceException("无法加载近期加入班级录的校友!");
        }
        return null;
    }

    /**
     * TODO 条件查询组织
     *
     * @param page
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> queryOrigin(Page<Map<String, Object>> page) throws ServiceException {
        try {
            return classMapper.queryOrigin(page);
        } catch (Exception e) {
            throw new ServiceException("查询组织信息时发生异常！");
        }
    }
}
