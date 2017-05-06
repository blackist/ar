package com.xzit.ar.common.mapper.album;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;
import com.xzit.ar.common.po.album.Album;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AlbumMapper extends BaseMapper{

    /**
     * TODO 加载相册列表
     * @param page
     * @param originId
     * @return
     * @throws Exception
     */
    List<Album> getAlbums(Page<Album> page, @Param("originId") Integer originId) throws Exception;
    
}