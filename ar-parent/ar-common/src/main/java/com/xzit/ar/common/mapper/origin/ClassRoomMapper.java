/**  
 * @Title: ClassRoomMapper.java
 * @Package com.xzit.ar.common.mapper.origin
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月20日 下午4:14:37
 * @version V1.0  
 */
package com.xzit.ar.common.mapper.origin;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.SelectProvider;

import com.xzit.ar.common.base.BaseMapper;
import com.xzit.ar.common.page.Page;

/**
 * @ClassName: ClassRoomMapper
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月20日 下午4:14:37
 */
public interface ClassRoomMapper extends BaseMapper {

	@SelectProvider(type = ClassRoomProvider.class, method = "classIndex")
	Map<String, Object> classIndex(@Param("classId") Integer classId) throws Exception;

	@SelectProvider(type = ClassRoomProvider.class, method = "classDirectory")
	List<Map<String, Object>> classDirectory(Page<Map<String, Object>> page, @Param("classId") Integer classId)
			throws Exception;

	@SelectProvider(type = ClassRoomProvider.class, method = "classMember")
	List<Map<String, Object>> classMember(Page<Map<String, Object>> page, @Param("classId") Integer classId)
			throws Exception;

	@SelectProvider(type = ClassRoomProvider.class, method = "classInfo")
	List<Map<String, Object>> classInfo(Page<Map<String, Object>> page, @Param("classId") Integer classId)
			throws Exception;

	@SelectProvider(type = ClassRoomProvider.class, method = "classMessage")
	List<Map<String, Object>> classMessage(Page<Map<String, Object>> page, @Param("classId") Integer classId)
			throws Exception;

	@SelectProvider(type = ClassRoomProvider.class, method = "classInfoDetail")
	Map<String, Object> classInfoDetail(@Param("classId") Integer classId, @Param("infoId") Integer infoId)
			throws Exception;

}
