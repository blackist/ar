package com.xzit.ar.common.mapper.album;

import com.xzit.ar.common.base.BaseMapper;
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
}