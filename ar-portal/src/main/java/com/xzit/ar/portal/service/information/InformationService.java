package com.xzit.ar.portal.service.information;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Information;

import java.util.List;
import java.util.Map;

/**
 * 信息相关业务
 * Created by 董亮亮 on 2017/4/7.
 */
public interface InformationService {

    /**
     * 根据information id 加载信息
     *
     * @param infoId
     * @return
     */
    Information getInfoById(Integer infoId) throws ServiceException;

    /**
     * 加载组织最近消息
     *
     * @param page     分页类
     * @param originId 组织id
     * @return 消息列表
     */
    List<Map<String, Object>> getOriginInfos(Page<Map<String, Object>> page, Integer originId, String infoType) throws ServiceException;

    /**
     * @param page
     * @param originId
     * @param originId
     * @return
     */
    List<Map<String, Object>> getOriginUserInfos(Page<Map<String, Object>> page, Integer userId, Integer originId, String infoType) throws ServiceException;

    /**
     * 通过 消息id 和 组织id 获取消息详情
     *
     * @param infoId
     * @param originId
     * @return
     */
    Map<String, Object> getInfoByInfoIdAndOriginId(Integer infoId, Integer originId) throws ServiceException;

    /**
     * 发布组织动态消息
     *
     * @param information 消息实体
     * @return
     */
    Integer publishOriginInfo(Information information) throws ServiceException;

    /**
     * 为消息点赞
     *
     * @param infoId 消息id
     * @return 返回点赞的总数
     */
    Integer loveInfo(Integer infoId) throws ServiceException;

    /**
     * 删除消息
     *
     * @param infoId
     * @param userId
     * @return
     */
    Integer deleteInfo(Integer infoId, Integer userId) throws ServiceException;

    /**
     * 查询用户发布的某一类消息
     *
     * @param userId
     * @param infoType
     * @return
     */
    List<Map<String, Object>> getInfoByUserIdAndInfoType(Page<Map<String, Object>> page, Integer userId, String infoType) throws ServiceException;

    /**
     * 按消息类型查询消息
     * @param page
     * @param infoType
     * @return
     */
    List<Map<String, Object>> getInfoByInfoType(Page<Map<String, Object>> page, String infoType);

    /**
     * 按消息类型查询热门消息
     * @param infoType
     * @return
     */
    List<Map<String, Object>> getHotInfoByInfoType(Page<Map<String, Object>> page, String infoType) throws ServiceException;

}
