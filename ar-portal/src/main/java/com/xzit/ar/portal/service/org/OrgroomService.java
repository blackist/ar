package com.xzit.ar.portal.service.org;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.po.origin.Origin;
import com.xzit.ar.common.po.user.UserOrigin;

import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/18 23:32.
 */
public interface OrgroomService {


    /**
     * TODO 根据 originId 查询 origin 基本信息
     * @param originId  orginId
     * @return  origin 信息
     * @throws ServiceException
     */
    Origin getOriginById(Integer originId) throws ServiceException;

    /**
     * TODO 加载组织成员id列表
     * @return  成员id列表
     * @throws ServiceException
     */
    List<Integer> getMemberIds(Integer originId) throws ServiceException;

    /**
     * TODO 当前用户加入组织
     * @param userOrigin
     * @return
     * @throws ServiceException
     */
    Integer joinOrigin(UserOrigin userOrigin) throws ServiceException;

    /**
     * TODO 查询组织成员列表
     * @param page 
     * @param originId
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> getOriginMember(Page<Map<String, Object> > page, Integer originId) throws ServiceException;

    /**
     * TODO 加载班级成员通讯录列表
     * @param page  分页类
     * @param originId  originId
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> getOriginDirectory(Page<Map<String, Object> > page, Integer originId) throws ServiceException;
}
