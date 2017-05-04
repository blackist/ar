/**  
* @Title: BaseMapper.java <br>
* @Package com.xzit.ar.common.base <br>
* @Description: TODO BaseMapper<br>
* @author Mr.Black <br>
* @date 2015年12月21日 下午2:24:05 <br>
* @version V1.0 <br>
*/
package com.xzit.ar.common.base;

import java.io.Serializable;
import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * @ClassName: BaseMapper <br>
 * @Description: TODO BaseMapper<br>
 * @author Mr.Black <br>
 * @date 2015年12月21日 下午2:24:05 <br>
 * @version V1.0 <br>
 *          <br>
 */
public interface BaseMapper {

	/**
	 * 保存
	 */
	int save(BaseEntity t) throws Exception;

	/**
	 * 根据Id查询
	 */
	<T extends BaseEntity> T getById(final Serializable id) throws Exception;

	/**
	 * 根据实体查询
	 */
	<T extends BaseEntity> T getByEntity(BaseEntity entity) throws Exception;

	/**
	 * 更新实体
	 */
	int update(BaseEntity entity) throws Exception;
	
	/**
	 * 更新实体状态
	 */
	int updateState(@Param("id") Integer id, @Param("state") String state) throws Exception;
	
	/**
	 * 更新实体
	 */
	int batchState(@Param("ids") List<Integer> ids, @Param("state") String state);

	/**
	 * 删除实体
	 */
	int deleteEntities(@Param("ids") List<Integer> ids) throws Exception;

	/**
	 * 根据Id删除实体
	 */
	<T extends BaseEntity> Integer delete(final Serializable id) throws Exception;

	/**
	 * 查询所有，用于加载下拉框的option项
	 */
	<T extends BaseEntity> List<T> getAll()  ;
}
