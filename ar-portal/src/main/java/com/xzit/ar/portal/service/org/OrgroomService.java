package com.xzit.ar.portal.service.org;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.po.origin.Origin;
import com.xzit.ar.common.po.user.UserOrigin;

import java.util.List;
import java.util.Map;

/**
 * 描述
 *
 * @author 董亮亮 1075512174@qq.com.
 * @Date:2017/4/18 23:32.
 */
public interface OrgroomService {


    /**
     * 根据 originId 查询 origin 基本信息
     * @param originId  orginId
     * @return  origin 信息
     */
    Origin getOriginById(Integer originId) throws ServiceException;

    /**
     * 加载组织成员id列表
     * @return  成员id列表
     */
    List<Integer> getMemberIds(Integer originId) throws ServiceException;

    /**
     * 当前用户加入组织
     * @param userOrigin
     * @return
     */
    Integer joinOrigin(UserOrigin userOrigin) throws ServiceException;

    /**
     * 查询组织成员列表
     * @param page 
     * @param originId
     * @return
     */
    List<Map<String, Object>> getOriginMember(Page<Map<String, Object> > page, Integer originId) throws ServiceException;

    /**
     * 加载班级成员通讯录列表
     * @param page  分页类
     * @param originId  originId
     * @return
     */
    List<Map<String, Object>> getOriginDirectory(Page<Map<String, Object> > page, Integer originId) throws ServiceException;
}
