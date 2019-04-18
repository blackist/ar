package com.xzit.ar.portal.service.information.impl;

import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.mapper.info.CommentMapper;
import com.xzit.ar.common.mapper.info.InformationMapper;
import com.xzit.ar.common.mapper.origin.OriginMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.info.Information;
import com.xzit.ar.common.po.origin.Origin;
import com.xzit.ar.common.util.CommonUtil;
import com.xzit.ar.portal.service.information.InformationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * TODO ${TODO}
 * Created by 董亮亮 on 2017/4/7.
 */
@Service("informationService")
public class InformationServiceImpl implements InformationService {

    @Resource
    private InformationMapper informationMapper;

    @Resource
    private CommentMapper commentMapper;

    @Resource
    private OriginMapper originMapper;


    /**
     * TODO 记载组织最近消息
     *
     * @param page     分页类
     * @param originId 组织id
     * @return 消息列表
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getOriginInfos(Page<Map<String, Object>> page, Integer originId, String infoType)
            throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(originId)) {
                // 查询
                return originMapper.getOriginInfosByType(page, originId, infoType);
            }
        } catch (Exception e) {
            throw new ServiceException("加载最近消息时失败！");
        }
        return null;
    }

    /**
     * TODO 加载组织内某一成员的动态消息
     *
     * @param page
     * @param originId
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getOriginUserInfos(Page<Map<String, Object>> page, Integer userId, Integer originId,
                                                        String infoType) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(userId) && CommonUtil.isNotEmpty(originId) && CommonUtil.isNotEmpty(infoType)) {
                // 查询消息
                return informationMapper.loadOriginUserInfos(page, userId, originId, infoType);
            }
        } catch (Exception e) {
            throw new ServiceException("加载消息时发生异常");
        }
        return null;
    }

    /**
     * TODO 通过 消息id 和 组织id 获取消息详情
     *
     * @param infoId
     * @param originId
     * @return
     * @throws ServiceException
     */
    @Override
    public Map<String, Object> getInfoByInfoIdAndOriginId(Integer infoId, Integer originId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(infoId) && CommonUtil.isNotEmpty(originId)) {
                // 增加浏览量
                informationMapper.increaseViews(infoId);
                return informationMapper.getInfoByInfoIdAndOriginId(infoId, originId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载消息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 根据information id 加载信息
     *
     * @param infoId
     * @return
     * @throws ServiceException
     */
    @Override
    public Information getInfoById(Integer infoId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(infoId)) {
                // 浏览量
                informationMapper.increaseViews(infoId);
                // 插叙怒消息
                return informationMapper.getById(infoId);
            }
        } catch (Exception e) {
            throw new ServiceException("加载信息时发生异常！");
        }
        return null;
    }

    /**
     * TODO 发布组织动态消息、留言，并修改组织的状态时间（最近活动时间）
     *
     * @param information 消息实体
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer publishOriginInfo(Information information) throws ServiceException {
        try {
            // 参数校验
            int originId = information.getOriginId();
            if (CommonUtil.isNotEmpty(originId) && CommonUtil.isNotEmpty(information.getUserId())) {
                // 消息发布成功后，更新班级活动时间
                if (informationMapper.save(information) > 0) {
                    Origin origin = new Origin();
                    origin.setOriginId(originId);
                    origin.setStateTime(new Date());
                    // 更新origin状态时间
                    originMapper.update(origin);
                }
            }
        } catch (Exception e) {
            throw new ServiceException("发布消息时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 为消息点赞
     *
     * @param infoId 消息id
     * @return 返回点赞的总数
     * @throws ServiceException
     */
    @Override
    public Integer loveInfo(Integer infoId) throws ServiceException {
        try {
            // 校验参数
            if (CommonUtil.isNotEmpty(infoId)) {
                // 点赞存储
                informationMapper.increaseLoves(infoId);
                // 查询消息点赞总数
                return informationMapper.getLoves(infoId);
            }
        } catch (Exception e) {
            throw new ServiceException("发生异常！");
        }
        return null;
    }

    /**
     * TODO 删除消息
     *
     * @param infoId
     * @param userId
     * @return
     * @throws ServiceException
     */
    @Override
    public Integer deleteInfo(Integer infoId, Integer userId) throws ServiceException {
        try {
            // 参数校验
            if (CommonUtil.isNotEmpty(infoId) && CommonUtil.isNotEmpty(userId)) {
                // 检验帖子是否存在
                if (informationMapper.getInfoByUserIdAndInfoId(infoId, userId) != null) {
                    // 删除帖子相关评论
                    commentMapper.deleteCommentByInfoId(infoId);
                    // 删除帖子
                    return informationMapper.delete(infoId);
                }
            }
            if (CommonUtil.isNotEmpty(infoId)) {
                return informationMapper.delete(infoId);
            }
        } catch (Exception e) {
            throw new ServiceException("删除消息时发生异常！");
        }
        return 0;
    }

    /**
     * TODO 查询用户发布的某一类消息
     *
     * @param userId
     * @param infoType
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getInfoByUserIdAndInfoType(Page<Map<String, Object>> page, Integer userId, String infoType)
            throws ServiceException {
        try {
            informationMapper.getInfoByUserIdAndInfoType(page, userId, infoType);
        } catch (Exception e) {
            throw new ServiceException("加载消息时发生异常!");
        }

        return null;
    }

    /**
     * TODO 按消息类型查询消息
     *
     * @param page
     * @param infoType
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>>
    getInfoByInfoType(Page<Map<String, Object>> page, String infoType) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(infoType)) {
                return informationMapper.getInfoByInfoType(page, infoType);
            }
        } catch (Exception e) {
            throw new ServiceException("查询信息时发生异常");
        }
        return null;
    }

    /**
     * TODO 按消息类型查询热门消息
     *
     * @param infoType
     * @return
     * @throws ServiceException
     */
    @Override
    public List<Map<String, Object>> getHotInfoByInfoType(Page<Map<String, Object>> page, String infoType) throws ServiceException {
        try {
            if (CommonUtil.isNotEmpty(infoType)) {
                return informationMapper.getHotInfoByInfoType(page, infoType);
            }
        } catch (Exception e) {
            throw new ServiceException("查询信息时发生异常");
        }
        return null;
    }
}
