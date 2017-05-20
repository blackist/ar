package com.xzit.ar.common.mapper.recruit;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.po.recruit.RecruitUnit;

public interface RecruitUnitMapper extends BaseMapper {

	List<RecruitUnit> getUnitsByUserId(@Param("userId") Integer userId) throws Exception;
}