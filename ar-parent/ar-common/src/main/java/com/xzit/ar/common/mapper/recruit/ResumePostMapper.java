package com.xzit.ar.common.mapper.recruit;

import java.util.List;
import java.util.Map;

import com.xzit.ar.common.page.Page;
import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.po.recruit.ResumePost;

public interface ResumePostMapper extends BaseMapper {

    /**
     * TODO 加载招聘信息的简历投递记录
     *
     * @param recruitId
     * @return
     * @throws Exception
     */
    List<Map<String, Object>> postResumeRecord(@Param("recruitId") Integer recruitId) throws Exception;

    /**
     * TODO
     *
     * @param resumePost
     * @return
     */
    List<Map<String, Object>> checkResumeRecord(ResumePost resumePost);

    /**
     * TODO 恢复简历投递
     *
     * @param resumePost
     * @return
     */
    int recoverResumeRecord(ResumePost resumePost);

    /**
     * TODO 取消简历投递
     * @param recruitId
     * @param resumeId
     * @return
     */
    int deletePost(@Param("recruitId") Integer recruitId, @Param("resumeId") Integer resumeId) throws Exception;

    /**
     * TODO 加载用户简历投递记录
     * @param page
     * @param userId
     * @return
     * @throws Exception
     */
    List<Map<String, Object>> getPostByUserId(Page<Map<String, Object>> page, @Param("userId") Integer userId) throws Exception;
}