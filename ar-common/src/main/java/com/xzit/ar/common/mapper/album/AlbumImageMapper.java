package com.xzit.ar.common.mapper.album;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.exception.ServiceException;
import com.xzit.ar.common.page.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface AlbumImageMapper extends BaseMapper {

    /**
     * TODO 加载相册图片
     * @param albumId
     * @return
     * @throws Exception
     */
    List<Map<String, Object>> getAlbumImage(Page<Map<String, Object>> page, @Param("albumId") Integer albumId) throws Exception;

    /**
     * TODO 删除相册的图片
     * @param imageId
     * @return
     * @throws Exception
     */
    Integer deleteAlbumImage(@Param("imageId") Integer imageId) throws Exception;

    /**
     * TODO 删除相册时删除关联图片
     * @param albumId
     * @return
     * @throws ServiceException
     */
    Integer deleteAlbum(Integer albumId) throws ServiceException;
}