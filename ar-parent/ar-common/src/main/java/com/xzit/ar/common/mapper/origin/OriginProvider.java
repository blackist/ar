/**  
 * @Title: OriginProvider.java
 * @Package com.xzit.ar.common.mapper.origin
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月18日 下午2:06:27
 * @version V1.0  
 */
package com.xzit.ar.common.mapper.origin;

/**
 * @ClassName: OriginProvider
 * @Description: TODO origin表的sql语句
 * @author Mr.Black
 * @date 2016年2月18日 下午2:06:27
 */
public class OriginProvider {

	String entity = "origin_id, origin_name, origin_type, origin_grade, members, origin_desc,create_time, creator_id, state, state_time ";

	String clazz = " o.origin_id classId, o.origin_name className, o.origin_grade originGrade, o.members members, o.create_time createTime , o.state state ";

	public String queryClasses() {
		return "select distinct " + clazz 
				+ "from origin o, user_origin uo, user u "
				+ "where o.origin_grade like #{originGrade} "
				+ "and (o.origin_name like #{queryStr} or u.true_name like #{queryStr}) "
				+ "and (uo.origin_id=o.origin_id or 1=1) and u.user_id=uo.user_id  and uo.state='A' "
				+ "and o.state like #{state} and o.origin_type='C' order by o.create_time desc ";
	}
	
	public String countOriginNumByType(){
		return "select count(origin_id) from origin where origin_type=#{originType} and state='A'";
	}
	
	public String countOriginMembersByType(){
		return "select count(uo.user_id) from origin o, user_origin uo where o.origin_type=#{originType} and uo.origin_id = o.origin_id and uo.state='A'";
	}
	
	public String loadMyOrigin(){
		return "select o.origin_name originName, o.origin_id originId, o.state_time stateTime, o.members members "
				+ "from origin o, user_origin uo "
				+ "where uo.user_id=#{userId} and o.origin_id=uo.origin_id "
				+ "and o.origin_type=#{originType} and uo.state='A' and o.state='A' "
				+ "order by o.origin_grade desc";
	}
	
	public String loadPopularOrigin(){
		return "select origin_name originName, origin_id originId, members members "
				+ "from origin "
				+ "where origin_type=#{originType} and state='A' "
				+ "order by members desc limit 0,#{number}";
	}
	
	public String latestMembers(){
		return "select o.origin_name originName, o.origin_id originId, u.user_id userId, u.true_name trueName, "
				+ "img.image_path imgPath, uo.create_time createTime "
				+ "from origin o, user_origin uo, user u, image img "
				+ "where o.origin_type=#{originType} and o.state='A' and uo.state='A' "
				+ "and o.origin_id=uo.origin_id and uo.user_id=u.user_id and img.image_id=u.image_id "
				+ "order by uo.create_time desc limit 0,#{number}";
	}
	
	public String addOriginMemberNum(){
		return "update origin set members=(members+1) where origin_id=#{originId}";
	}
	
	public String updateOriginDesc(){
		return "update origin set origin_desc=#{originDesc} where origin_id=#{originId}";
	}
}
