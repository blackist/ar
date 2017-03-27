package com.xzit.ar.common.mapper.album;

import com.xzit.ar.common.po.album.AlbumImage;

public interface AlbumImageMapper {
    int insert(AlbumImage record);

    int insertSelective(AlbumImage record);
}