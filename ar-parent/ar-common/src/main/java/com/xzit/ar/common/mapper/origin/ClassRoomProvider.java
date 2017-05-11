/**  
 * @Title: ClassRoomProvider.java
 * @Package com.xzit.ar.common.mapper.origin
 * @Description: TODO
 * @author Mr.Black
 * @date 2016年2月20日 下午4:10:25
 * @version V1.0  
 */
package com.xzit.ar.common.mapper.origin;

/**
 * @ClassName: ClassRoomProvider
 * @Description: TODO Class SQL
 * @author Mr.Black
 * @date 2016年2月20日 下午4:10:25
 */
public class ClassRoomProvider {

	public String classIndex() {
		return "select o.origin_id classId, o.origin_name className, o.origin_grade classGrade, o.origin_desc classDesc, "
				+ "o.members members, o.create_time createTime "
				+ "from origin o "
				+ "where o.origin_id=#{classId} and o.state='A'";
	}
	
	public String classDirectory(){
		return "select ui.qq qq, ui.phone phone, ui.email email, u.user_id userId, u.true_name trueName, "
				+ "ui.microblog microblog, ui.wechat wechat, ui.address address, img.image_path imgPath "
				+ "from origin o, user_origin uo, user_info ui, image img, user u "
				+ "where o.origin_id=#{classId} and o.state='A' "
				+ "and uo.origin_id=o.origin_id and uo.state='A' and ui.user_id=uo.user_id "
				+ "and u.user_id=ui.user_id and img.image_id=u.image_id ";
	}
	
	public String classMember(){
		return "select u.true_name trueName, u.user_id userId, img.image_path imgPath "
				+ "from origin o, user_origin uo, image img, user u "
				+ "where o.origin_id=#{classId} and o.state='A' "
				+ "and uo.origin_id=o.origin_id and uo.state='A' and u.user_id=uo.user_id "
				+ "and img.image_id=u.image_id order by uo.state_time ";
	}
	
	public String classInfo(){
		return "select info.info_title infoTitle, info.content content, info.thumb_image thumbImage, info.comments comments, "
				+ "info.create_time createTime, info.info_id infoId, info.user_id userId, u.true_name userName, info.is_top isTop "
				+ "from information info, `user` u "
				+ "where info.user_id=u.user_id "
				+ "and info.origin_id=#{classId} and info.info_type='CI' and info.state='A' "
				+ "order by info.is_top desc, info.create_time desc ";
	}
	
	public String classMessage(){
		return "select info.info_title infoTitle, info.content content, info.comments comments, "
				+ "info.create_time createTime, info.info_id infoId, info.user_id userId, u.true_name userName "
				+ "from information info, user u "
				+ "where info.user_id=u.user_id "
				+ "and info.origin_id=#{classId} and info.info_type='CM' and info.state='A' "
				+ "order by info.create_time desc";
	}
	
	public String classInfoDetail(){
		return "select info.info_title infoTitle, info.content content, info.thumb_image thumbImage, info.comments comments, "
				+ "info.create_time createTime, info.info_id infoId, info.user_id userId, u.true_name trueName, "
				+ "img.image_path portrait, u.introduce introduce, "
				+ "info.views views, info.loves loves "
				+ "from information info, `user` u, image img "
				+ "where info.user_id=u.user_id and u.image_id=img.image_id "
				+ "and info.origin_id=#{classId} and info.info_id=#{infoId} and info.info_type='CI' and info.state='A' ";
	}
}
