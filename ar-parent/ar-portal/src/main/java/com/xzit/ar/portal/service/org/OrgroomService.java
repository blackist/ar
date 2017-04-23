package com.xzit.ar.portal.service.org;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.po.origin.Origin;

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
     * TODO 发布组织动态消息
     * @param information 消息实体
     * @return
     * @throws ServiceException
     */
    Integer publishOriginInfo(Information information) throws ServiceException;

    /**
     * TODO 动态加载动态消息的评论
     * @param infoId
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> dynamicLoadComment(Page<Map<String, Object> > page, Integer infoId) throws ServiceException;

    /**
     * TODO 加载组织留言
     * @param page
     * @param originId
     * @return
     * @throws ServiceException
     */
    List<Map<String, Object>> getOriginMessage(Page<Map<String, Object> > page, Integer originId) throws ServiceException;

}
